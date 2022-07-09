import 'dart:math' as math;

import 'package:flutter/material.dart';

enum PressType {
  longPress,
  singleClick,
  doubleClick,
}

enum PreferredPosition {
  top,
  bottom,
}

class SmartPopupController extends ChangeNotifier {
  bool isShowing = false;

  void show() {
    isShowing = true;
    notifyListeners();
  }

  void hide() {
    isShowing = false;
    notifyListeners();
  }

  void toggleContrarily() {
    isShowing = !isShowing;
    notifyListeners();
  }
}

Rect _popupRect = Rect.zero;

class SmartPopup extends StatefulWidget {
  const SmartPopup({
    Key? key,
    required this.anchor,
    required this.popupBuilder,
    required this.pressType,
    this.controller,
    this.arrowColor = const Color(0xFF4C4C4C),
    this.showArrow = true,
    this.barrierColor = Colors.black12,
    this.arrowSize = 10.0,
    this.horizontalMargin = 10.0,
    this.verticalMargin = 10.0,
    this.position,
    this.popupOnChange,
    this.enablePassEvent = true,
  }) : super(key: key);

  final Widget anchor;
  final PressType pressType;
  final bool showArrow;
  final Color arrowColor;
  final Color barrierColor;
  final double horizontalMargin;
  final double verticalMargin;
  final double arrowSize;
  final SmartPopupController? controller;
  final Widget Function() popupBuilder;
  final PreferredPosition? position;
  final void Function(bool)? popupOnChange;

  /// Pass tap events to the widgets below the mask.
  /// It only works when [barrierColor] is transparent.
  final bool enablePassEvent;

  @override
  _SmartPopupState createState() => _SmartPopupState();
}

class _SmartPopupState extends State<SmartPopup> {
  RenderBox? _childBox;
  RenderBox? _parentBox;
  OverlayEntry? _overlayEntry;
  SmartPopupController? _controller;
  bool _canResponse = true;

  _showMenu() {
    Widget arrow = ClipPath(
      child: Container(
        width: widget.arrowSize,
        height: widget.arrowSize,
        color: widget.arrowColor,
      ),
      clipper: _ArrowClipper(),
    );

    _overlayEntry = OverlayEntry(
      builder: (context) {
        Widget popup = Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: _parentBox!.size.width - 2 * widget.horizontalMargin,
              minWidth: 0,
            ),
            child: CustomMultiChildLayout(
              delegate: _MenuLayoutDelegate(
                anchorSize: _childBox!.size,
                anchorOffset: _childBox!.localToGlobal(
                  Offset(-widget.horizontalMargin, 0),
                ),
                verticalMargin: widget.verticalMargin,
                position: widget.position,
              ),
              children: <Widget>[
                if (widget.showArrow)
                  LayoutId(
                    id: _popupLayoutId.arrow,
                    child: arrow,
                  ),
                if (widget.showArrow)
                  LayoutId(
                    id: _popupLayoutId.downArrow,
                    child: Transform.rotate(
                      angle: math.pi,
                      child: arrow,
                    ),
                  ),
                LayoutId(
                  id: _popupLayoutId.content,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Material(
                        child: widget.popupBuilder(),
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        return Listener(
          behavior: widget.enablePassEvent ? HitTestBehavior.translucent : HitTestBehavior.opaque,
          onPointerDown: (PointerDownEvent event) {
            Offset offset = event.localPosition;
            // If tap position in menu
            if (_popupRect.contains(Offset(offset.dx - widget.horizontalMargin, offset.dy))) {
              return;
            }
            _controller?.hide();
            // When [enablePassEvent] works and we tap the [child] to [hideMenu],
            // but the passed events would trigger [showMenu] again.
            // So, we use time threshold to solve this bug.
            _canResponse = false;
            Future.delayed(const Duration(milliseconds: 100)).then((_) => _canResponse = true);
          },
          child: widget.barrierColor == Colors.transparent
              ? popup
              : Container(
                  color: widget.barrierColor,
                  child: popup,
                ),
        );
      },
    );
    if (_overlayEntry != null) {
      Overlay.of(context)!.insert(_overlayEntry!);
    }
  }

  _hide() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  _updateView() {
    bool isShowing = _controller?.isShowing ?? false;
    widget.popupOnChange?.call(isShowing);
    if (isShowing) {
      _showMenu();
    } else {
      _hide();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller ??= SmartPopupController();
    _controller?.addListener(_updateView);

    WidgetsBinding.instance.addPostFrameCallback((call) {
      if (mounted) {
        _childBox = context.findRenderObject() as RenderBox?;
        _parentBox = Overlay.of(context)?.context.findRenderObject() as RenderBox?;
      }
    });
  }

  @override
  void dispose() {
    _hide();
    _controller?.removeListener(_updateView);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var child = Material(
      child: InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: widget.anchor,
        onTap: () {
          if (widget.pressType == PressType.singleClick && _canResponse) {
            _controller?.show();
          }
        },
        onLongPress: () {
          if (widget.pressType == PressType.longPress && _canResponse) {
            _controller?.show();
          }
        },
        onDoubleTap: () {
          if (widget.pressType == PressType.doubleClick && _canResponse) {
            _controller?.show();
          }
        },
      ),
      color: Colors.transparent,
    );
    return WillPopScope(
      onWillPop: () {
        _hide();
        return Future.value(true);
      },
      child: child,
    );
  }
}

enum _popupLayoutId {
  arrow,
  downArrow,
  content,
}

enum _popupPosition {
  bottomLeft,
  bottomCenter,
  bottomRight,
  topLeft,
  topCenter,
  topRight,
}

class _MenuLayoutDelegate extends MultiChildLayoutDelegate {
  _MenuLayoutDelegate({
    required this.anchorSize,
    required this.anchorOffset,
    required this.verticalMargin,
    this.position,
  });

  final Size anchorSize;
  final Offset anchorOffset;
  final double verticalMargin;
  final PreferredPosition? position;

  @override
  void performLayout(Size size) {
    Size contentSize = Size.zero;
    Size arrowSize = Size.zero;
    Offset contentOffset = const Offset(0, 0);
    Offset arrowOffset = const Offset(0, 0);

    double anchorCenterX = anchorOffset.dx + anchorSize.width / 2;
    double anchorTopY = anchorOffset.dy;
    double anchorBottomY = anchorTopY + anchorSize.height;
    _popupPosition popupPosition = _popupPosition.bottomCenter;

    if (hasChild(_popupLayoutId.content)) {
      contentSize = layoutChild(
        _popupLayoutId.content,
        BoxConstraints.loose(size),
      );
    }
    if (hasChild(_popupLayoutId.arrow)) {
      arrowSize = layoutChild(
        _popupLayoutId.arrow,
        BoxConstraints.loose(size),
      );
    }
    if (hasChild(_popupLayoutId.downArrow)) {
      layoutChild(
        _popupLayoutId.downArrow,
        BoxConstraints.loose(size),
      );
    }

    bool isTop = false;
    if (position == null) {
      // auto calculate position
      isTop = anchorBottomY > size.height / 2;
    } else {
      isTop = position == PreferredPosition.top;
    }
    if (anchorCenterX - contentSize.width / 2 < 0) {
      popupPosition = isTop ? _popupPosition.topLeft : _popupPosition.bottomLeft;
    } else if (anchorCenterX + contentSize.width / 2 > size.width) {
      popupPosition = isTop ? _popupPosition.topRight : _popupPosition.bottomRight;
    } else {
      popupPosition = isTop ? _popupPosition.topCenter : _popupPosition.bottomCenter;
    }

    switch (popupPosition) {
      case _popupPosition.bottomCenter:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorBottomY + verticalMargin,
        );
        contentOffset = Offset(
          anchorCenterX - contentSize.width / 2,
          anchorBottomY + verticalMargin + arrowSize.height,
        );
        break;
      case _popupPosition.bottomLeft:
        arrowOffset = Offset(anchorCenterX - arrowSize.width / 2, anchorBottomY + verticalMargin);
        contentOffset = Offset(
          0,
          anchorBottomY + verticalMargin + arrowSize.height,
        );
        break;
      case _popupPosition.bottomRight:
        arrowOffset = Offset(anchorCenterX - arrowSize.width / 2, anchorBottomY + verticalMargin);
        contentOffset = Offset(
          size.width - contentSize.width,
          anchorBottomY + verticalMargin + arrowSize.height,
        );
        break;
      case _popupPosition.topCenter:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorTopY - verticalMargin - arrowSize.height,
        );
        contentOffset = Offset(
          anchorCenterX - contentSize.width / 2,
          anchorTopY - verticalMargin - arrowSize.height - contentSize.height,
        );
        break;
      case _popupPosition.topLeft:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorTopY - verticalMargin - arrowSize.height,
        );
        contentOffset = Offset(
          0,
          anchorTopY - verticalMargin - arrowSize.height - contentSize.height,
        );
        break;
      case _popupPosition.topRight:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorTopY - verticalMargin - arrowSize.height,
        );
        contentOffset = Offset(
          size.width - contentSize.width,
          anchorTopY - verticalMargin - arrowSize.height - contentSize.height,
        );
        break;
    }
    if (hasChild(_popupLayoutId.content)) {
      positionChild(_popupLayoutId.content, contentOffset);
    }

    _popupRect = Rect.fromLTWH(
      contentOffset.dx,
      contentOffset.dy,
      contentSize.width,
      contentSize.height,
    );
    bool isBottom = false;
    if (_popupPosition.values.indexOf(popupPosition) < 3) {
      // bottom
      isBottom = true;
    }
    if (hasChild(_popupLayoutId.arrow)) {
      positionChild(
        _popupLayoutId.arrow,
        isBottom ? Offset(arrowOffset.dx, arrowOffset.dy + 0.1) : const Offset(-100, 0),
      );
    }
    if (hasChild(_popupLayoutId.downArrow)) {
      positionChild(
        _popupLayoutId.downArrow,
        !isBottom ? Offset(arrowOffset.dx, arrowOffset.dy - 0.1) : const Offset(-100, 0),
      );
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}

class _ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
