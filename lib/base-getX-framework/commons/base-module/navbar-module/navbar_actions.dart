import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/smart-popup/smart_popup_creator.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/smart_pop_up.dart';

enum NavBarActionType { text, icon, none }

class PopupCtrl {
  final SmartPopupController controller;
  Widget? widget;

  PopupCtrl(this.controller, this.widget);
}

class NavBarAction {
  String? text;
  IconData? icon;
  VoidCallback? onTap;
  bool isAnchor;
  PopupCtrl? popup;

  NavBarAction({
    this.text,
    this.icon,
    this.onTap,
    this.isAnchor = false,
    this.popup,
  });

  NavBarAction.text(this.text, {this.isAnchor = false, this.popup});

  NavBarAction.icon(this.icon, {this.isAnchor = false, this.popup});

  set setCallback(VoidCallback onTap) {
    onTap = onTap;
  }

  NavBarActionType _judgeValid() {
    if (null != text) {
      return NavBarActionType.text;
    } else if (null != icon) {
      return NavBarActionType.icon;
    } else {
      return NavBarActionType.none;
    }
  }

  Widget action() {
    NavBarActionType type = _judgeValid();
    Widget actionWidget;

    if (type == NavBarActionType.text) {
      actionWidget = BrnTextAction(
        text!,
        iconPressed: onTap,
      );
    } else if (type == NavBarActionType.icon) {
      actionWidget = BrnIconAction(iconPressed: onTap ?? () {}, child: Icon(icon));
    } else {
      return const SizedBox();
    }

    if (isAnchor && null != popup && null != popup!.widget) {
      actionWidget = SmartPopupCreator.smartFloatWidget(
        anchor: AbsorbPointer(
          child: actionWidget,
        ),
        child: popup!.widget!,
        controller: popup!.controller,
      );
    }

    return actionWidget;
  }
}

class NavBarActionHolder {
  final List<NavBarAction> _actions = [];

  NavBarActionHolder.holder();

  List<NavBarAction> get export => _actions;

  void add(NavBarAction action) {
    _actions.add(action);
  }
}

class NavBarActions {
  List<NavBarAction>? actions;

  NavBarActions.action(this.actions);

  List<Widget> actionWidgets() {
    return actions != null ? actions!.map((e) => e.action()).toList() : [];
  }
}
