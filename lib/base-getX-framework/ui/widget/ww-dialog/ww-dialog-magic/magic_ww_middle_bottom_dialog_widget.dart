// ignore_for_file: sized_box_for_whitespace, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/ww-dialog/ww_dialog.dart';

const colorH = Color(0xFFEEEEEE);
const colorWithCloseButton = Color(0xFFB2B4C6);

/// 默认自定义按钮（中间、底部弹窗自定义按钮）
Widget simpleCustomButton({
  String text = '',
  Color textColor = colorWithQ,
  double textFontSize = 17.0,
  FontWeight fontWeight = FontWeight.w500,
  bool needCloseDialog = true,
  double buttonHeight = 44.0,
  VoidCallback? onTap,
}) =>
    SizedBox(
      height: buttonHeight,
      child: TextButton(
        onPressed: () {
          if (needCloseDialog) {
            SmartDialog.dismiss(status: SmartStatus.dialog);
          }
          onTap?.call();
        },
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: textFontSize,
              color: textColor,
              fontWeight: fontWeight,
            )),
      ),
    );

/// 中间和底部弹窗Widget
class TTMagicBaseDialog extends StatefulWidget {
  /// 背景颜色 默认主题色
  late Color? bgColor;

  /// 是否有关闭按钮 默认没有
  late bool isShowCloseButton;

  /// 点击按钮是否需要关闭弹窗 默认为true
  late bool isNeedCloseDiaLog;

  /// 弹窗位置(中间、底部)
  /// 影响widget的创建类型和是否有系统取消按钮，弹出位置外部控制
  late DiaLogLocation location;

  /// 是否是系统底部弹窗
  late bool isSystemBottomDialog;

  /// 自定义标题组件 优先级：customTitleWidget > title
  late Widget? customTitleWidget;

  /// 标题
  late String? title;

  /// 标题颜色 默认 0x121D34
  late Color? titleColor;

  /// 标题字号 默认17
  late double titleFontSize;

  /// 标题字重 默认 500
  late FontWeight titleFontWeight;

  /// 标题区域布局 默认居中
  late TextAlign titleAlign;

  /// 自定义的content组件 优先级：customContentWidget > content
  late Widget? customContentWidget;

  /// 内容
  late String? content;

  /// 内容文字颜色 默认 0x121D34
  late Color? contentColor;

  /// 有标题内容字号 默认13
  late double contentFontSize;

  /// 无标题内容字号 默认17
  late double notTitleContentFontSize;

  /// 内容字重 默认400
  late FontWeight contentFontWeight;

  /// 内容区域布局 默认居中
  late TextAlign contentAlign;

  /// 自定义按钮list 优先级：widgetButtons > buttons
  late List<Widget>? customWidgetButtons;

  /// 按钮list
  late List<String>? buttons;

  /// 取消按钮字体颜色 默认 0x999999
  late Color cancelButtonColor;

  /// 其他按钮字体颜色 默认蓝色0x2989F2
  late Color otherButtonColor;

  /// 取消按钮字体大小 默认17
  late double cancelButtonFontSize;

  /// 其他按钮字体大小 默认17
  late double otherButtonFontSize;

  /// 取消按钮字重 默认400
  late FontWeight cancelButtonFontWeight;

  /// 按钮字重  默认500
  late FontWeight otherButtonFontWeight;

  /// 按钮排列方式 默认横向排列
  late ButtonArrangeType arrangeType;

  /// 点击返回index 0 1
  late Function(int index, BuildContext context)? onTap;

  /// 是否需要标题下方间隔
  late bool needTitleSizeBox;

  /// 是否需要内容下方间隔
  late bool needContentSizeBox;

  TTMagicBaseDialog({
    Key? key,
    this.bgColor,
    this.isShowCloseButton = false,
    this.isNeedCloseDiaLog = true,
    this.customTitleWidget,
    this.location = DiaLogLocation.middle,
    this.isSystemBottomDialog = false,
    this.title,
    this.titleColor,
    this.titleFontSize = 17,
    this.titleFontWeight = FontWeight.w500,
    this.titleAlign = TextAlign.center,
    this.customContentWidget,
    this.content,
    this.contentColor,
    this.contentFontSize = 13,
    this.notTitleContentFontSize = 17,
    this.contentAlign = TextAlign.center,
    this.contentFontWeight = FontWeight.w400,
    this.customWidgetButtons,
    this.buttons,
    this.cancelButtonColor = colorWithHex9,
    this.otherButtonColor = colorWithQ,
    this.cancelButtonFontSize = 17,
    this.otherButtonFontSize = 17,
    this.cancelButtonFontWeight = FontWeight.w400,
    this.otherButtonFontWeight = FontWeight.w500,
    this.arrangeType = ButtonArrangeType.row,
    this.onTap,
    this.needTitleSizeBox = true,
    this.needContentSizeBox = true,
  }) : super(key: key);

  @override
  _TTMagicBaseDialogState createState() => _TTMagicBaseDialogState();
}

class _TTMagicBaseDialogState extends State<TTMagicBaseDialog> {
  @override
  Widget build(BuildContext context) {
    return (widget.location == DiaLogLocation.bottom) ? _createBaseBottomDialog() : _createBaseMiddleDiaLog();
  }

  /// Bottom弹窗
  Widget _createBaseBottomDialog() {
    bool emptyTitle = ((widget.title == null || widget.title!.isEmpty) && widget.customTitleWidget == null); // 是否有标题
    bool emptyContent = ((widget.content == null || widget.content!.isEmpty) && widget.customContentWidget == null); // 是否有内容
    return Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          child: Container(
            margin: widget.isSystemBottomDialog ? const EdgeInsets.only(left: 10, bottom: 30, right: 10) : const EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: widget.bgColor ?? Theme.of(context).dialogBackgroundColor, borderRadius: BorderRadius.circular(6.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          child: emptyTitle
                              ? Container()
                              : (widget.customTitleWidget != null)
                                  ? widget.customTitleWidget
                                  : Container(
                                      child: Text(
                                        widget.title!,
                                        style:
                                            TextStyle(color: widget.titleColor, fontSize: widget.titleFontSize, fontWeight: widget.titleFontWeight),
                                      ),
                                      margin: const EdgeInsets.only(top: 10.0, bottom: 15),
                                    )),
                      Container(
                        child: emptyContent
                            ? Container()
                            : (widget.customContentWidget != null)
                                ? widget.customContentWidget
                                : Container(
                                    child: Text(
                                      widget.content!,
                                      style: TextStyle(
                                          color: widget.contentColor, fontSize: widget.contentFontSize, fontWeight: widget.contentFontWeight),
                                    ),
                                    margin: const EdgeInsets.all(10.0),
                                  ),
                        // height: 45,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: colorH,
                            width: 1,
                          ),
                        )),
                      ),
                      (widget.customWidgetButtons != null)
                          ? _createCustomButtons(widget.arrangeType)
                          : _createDefaultButtons(widget.arrangeType, 57.0)
                    ],
                  ),
                ),
                widget.isSystemBottomDialog ? const SizedBox(height: 8) : const SizedBox(),
                widget.isSystemBottomDialog
                    ? Container(
                        width: double.infinity,
                        child: simpleCustomButton(text: '取消', textFontSize: 20.0, buttonHeight: 57.0),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
                      )
                    : Container()
              ],
            ),
          ),
        ));
  }

  /// 中间弹窗相关方法
  Widget _createBaseMiddleDiaLog() {
    bool emptyTitle = ((widget.title == null || widget.title!.isEmpty) && widget.customTitleWidget == null); // 是否有标题
    bool emptyContent = ((widget.content == null || widget.content!.isEmpty) && widget.customContentWidget == null); // 是否有内容

    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Container(
          color: widget.bgColor ?? Theme.of(context).dialogBackgroundColor,
          width: (270),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: emptyTitle
                            ? Container()
                            : widget.customTitleWidget ??
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    widget.title!,
                                    textAlign: widget.titleAlign,
                                    style: TextStyle(color: widget.titleColor, fontSize: widget.titleFontSize, fontWeight: widget.titleFontWeight),
                                  ),
                                )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: (widget.isShowCloseButton == false)
                            ? Container()
                            : InkWell(
                                child: const Icon(
                                  Icons.close,
                                  color: colorWithCloseButton,
                                  size: 20,
                                ),
                                onTap: () {
                                  SmartDialog.dismiss(status: SmartStatus.dialog);
                                },
                              ))
                  ],
                ),
              ),
              if (widget.needTitleSizeBox) SizedBox(height: emptyTitle ? 10 : 10),
              emptyContent ? Container() : _getContentWidget(emptyTitle, emptyContent),
              if (widget.needContentSizeBox) const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: colorH,
                      width: 1,
                    ),
                  ),
                ),
              ),
              // 创建按钮
              (widget.customWidgetButtons != null) ? _createCustomButtons(widget.arrangeType) : _createDefaultButtons(widget.arrangeType, 44.0)
            ],
          ),
        ),
      ),
    );
  }

  /// 创建默认buttons组
  Widget _createDefaultButtons(ButtonArrangeType type, double buttonHeight) {
    return (widget.buttons == null || widget.buttons!.isEmpty)
        ? Container()
        : (type == ButtonArrangeType.column)
            ? _createDefaultColumnButtons(buttonHeight)
            : _createDefaultRowButtons(buttonHeight);
  }

  /// 创建默认列的buttons
  _createDefaultColumnButtons(double buttonHeight) {
    return Container(
      child: Column(
        children: widget.buttons!.map((res) {
          int index = widget.buttons!.indexOf(res);
          return GestureDetector(
            child: Container(
                width: double.infinity,
                child: simpleCustomButton(
                    textColor: widget.otherButtonColor,
                    textFontSize: widget.otherButtonFontSize,
                    fontWeight: widget.otherButtonFontWeight,
                    needCloseDialog: widget.isNeedCloseDiaLog,
                    text: res,
                    buttonHeight: buttonHeight,
                    onTap: () {
                      if (widget.onTap != null) {
                        widget.onTap!(index, context);
                      }
                    }),
                decoration: (index == widget.buttons!.length - 1)
                    ? const BoxDecoration()
                    : const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: colorH,
                            width: 1,
                          ),
                        ),
                      )),
          );
        }).toList(),
      ),
    );
  }

  /// 创建默认行的buttons
  _createDefaultRowButtons(double buttonHeight) {
    return Container(
      child: Row(
        children: widget.buttons!.map((res) {
          int index = widget.buttons!.indexOf(res);
          return Expanded(
            flex: 1,
            child: Container(
                child: simpleCustomButton(
                    needCloseDialog: widget.isNeedCloseDiaLog,
                    text: res,
                    textColor: (index == 0) ? widget.cancelButtonColor : widget.otherButtonColor,
                    textFontSize: (index == 0) ? widget.cancelButtonFontSize : widget.otherButtonFontSize,
                    fontWeight: (index == 0) ? widget.cancelButtonFontWeight : widget.otherButtonFontWeight,
                    buttonHeight: buttonHeight,
                    onTap: () {
                      if (widget.onTap != null) {
                        widget.onTap!(index, context);
                      }
                    }),
                decoration: (index == widget.buttons!.length - 1)
                    ? const BoxDecoration()
                    : const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: colorH,
                            width: 1.0,
                          ),
                        ),
                      )),
          );
        }).toList(),
      ),
    );
  }

  /// 创建自定义buttons
  Widget _createCustomButtons(ButtonArrangeType type) {
    return (widget.customWidgetButtons == null || widget.customWidgetButtons!.isEmpty)
        ? Container()
        : (type == ButtonArrangeType.column)
            ? _createCustomColumnButtons()
            : _createCustomRowButtons();
  }

  /// 创建自定义列的buttons
  _createCustomColumnButtons() {
    return Container(
      child: Column(
        children: widget.customWidgetButtons!.map((buttonWidget) {
          int index = widget.customWidgetButtons!.indexOf(buttonWidget);
          return Container(
              width: double.infinity,
              child: buttonWidget,
              decoration: (index == widget.customWidgetButtons!.length - 1)
                  ? const BoxDecoration()
                  : const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: colorH,
                          width: 1.0,
                        ),
                      ),
                    ));
        }).toList(),
      ),
    );
  }

  /// 创建自定义行的buttons
  _createCustomRowButtons() {
    return Container(
      child: Row(
        children: widget.customWidgetButtons!.map((buttonWidget) {
          int index = widget.customWidgetButtons!.indexOf(buttonWidget);
          return Expanded(
              flex: 1,
              child: Container(
                  child: buttonWidget,
                  decoration: (index == widget.customWidgetButtons!.length - 1)
                      ? const BoxDecoration()
                      : const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: colorH,
                              width: 1.0,
                            ),
                          ),
                        )));
        }).toList(),
      ),
    );
  }

  /// 获取弹窗content Widget
  _getContentWidget(emptyTitle, emptyContent) {
    return Container(
        width: double.infinity, // 跟外部容器等宽
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: (widget.customContentWidget != null)
            ? widget.customContentWidget
            : Text(
                widget.content!,
                textAlign: widget.contentAlign,
                style: TextStyle(
                    color: widget.contentColor,
                    fontSize: emptyTitle ? widget.notTitleContentFontSize : widget.contentFontSize,
                    fontWeight: widget.contentFontWeight),
              ));
  }
}
