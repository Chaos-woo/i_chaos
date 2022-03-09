// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// 带图标的文案
class IconText extends StatelessWidget {
  String? text;
  final Widget? icon;
  final double? iconSize;
  final Axis direction;

  final EdgeInsetsGeometry? iconPadding;
  final TextStyle? style;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  IconText({
    Key? key,
    this.text,
    this.icon,
    this.iconSize,
    this.direction = Axis.horizontal,
    this.style,
    this.maxLines,
    this.softWrap,
    this.iconPadding,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _style = DefaultTextStyle.of(context).style.merge(style);

    text = text ?? '';

    if (icon == null) {
      return Text(
        text!,
        style: _style,
      );
    }

    if (text == null || text!.isEmpty) {
      return (iconPadding == null
          ? icon!
          : Padding(
              padding: iconPadding!,
              child: icon,
            ));
    }

    final widgetSpan = WidgetSpan(
        child: IconTheme(
      data: IconThemeData(
        size: iconSize ?? (_style.fontSize == null ? 16 : _style.fontSize! + 1),
        color: _style.color,
      ),
      child: iconPadding == null
          ? icon!
          : Padding(
              padding: iconPadding!,
              child: icon,
            ),
    ));

    return RichText(
      text: TextSpan(style: _style, children: [
        widgetSpan,
        TextSpan(text: direction == Axis.horizontal ? text : "\n$text"),
      ]),
      maxLines: maxLines,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ?? (direction == Axis.horizontal ? TextAlign.start : TextAlign.center),
    );
  }
}
