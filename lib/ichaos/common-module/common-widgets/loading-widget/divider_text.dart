import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';
import 'package:text_divider/text_divider.dart';

class DividerTextWidget extends StatelessWidget {
  String text;
  bool needDiver;
  Color? color;

  DividerTextWidget({
    Key? key,
    this.text = '',
    this.needDiver = true,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color adaptedColor = color ?? AppStyle.colors.lightGray;
    final simpleText = Text(
      text,
      style: TextStyle(
        fontWeight: AppStyle.fontWidget.normal,
        color: adaptedColor,
        fontSize: AppStyle.fontSize.small_12,
      ),
    );

    return needDiver
        ? TextDivider.horizontal(
            text: simpleText,
            color: adaptedColor,
            thickness: 1.0,
          )
        : simpleText;
  }
}
