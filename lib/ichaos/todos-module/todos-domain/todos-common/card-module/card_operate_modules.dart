import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/card-module/card_module_mixin.dart';

class ButtonCompose {
  String? text;
  TextStyle? style;
  Widget? customButton;
  Icon? icon;
  VoidCallback? onTap;

  ButtonCompose({this.text, this.style, this.customButton, this.icon, this.onTap});
}

enum ButtonArrange { row, column }

// 与内容同时展现的按钮组
class CardVisibleButtonModule with CardModule {
  List<ButtonCompose> buttons;
  ButtonArrange arrange;
  MainAxisAlignment mainAxisAlignment;
  CrossAxisAlignment crossAxisAlignment;

  CardVisibleButtonModule(
    this.buttons, {
    this.arrange = ButtonArrange.row,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }
}

// 更多选项中的按钮组
class CardMoreButtonModule extends CardVisibleButtonModule with CardModule {
  CardMoreButtonModule(
    List<ButtonCompose> buttons, {
    ButtonArrange arrange = ButtonArrange.row,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(
          buttons,
          arrange: arrange,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
        );

  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }
}

// 特殊按钮组，独立于其他可视按钮，位置不受其它可视按钮影响，但是布局遵循可视按钮，若没有可视按钮时，使用自身的布局设置
class CardSpecialButtonModule extends CardVisibleButtonModule with CardModule {
  CardSpecialButtonModule(
    List<ButtonCompose> buttons, {
    ButtonArrange arrange = ButtonArrange.row,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(
          buttons,
          arrange: arrange,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
        );

  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }
}
