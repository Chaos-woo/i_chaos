import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/widget_state/base_stateless_widget.dart';

class CircleBorderContainer extends BaseStatelessWidget {
  final double? width, height;
  final Color? borderColor;
  final double? borderWidth;
  final String? text;
  final TextStyle? style;

  const CircleBorderContainer({Key? key, this.width, this.height, this.borderColor, this.borderWidth, this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: borderWidth!, color: borderColor!)),
      child: Text(
        text!,
        style: style,
      ),
    );
  }
}
