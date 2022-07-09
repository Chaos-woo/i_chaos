// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

enum OptionGroupTipPosition { left, right }

class OptionGroupTitle {
  String? title;
  Widget? tool;
  late OptionGroupTipPosition titlePosition;
  late OptionGroupTipPosition toolPosition;
  late bool tipFirst;

  OptionGroupTitle({
    this.title,
    this.tool,
    this.titlePosition = OptionGroupTipPosition.left,
    this.toolPosition = OptionGroupTipPosition.left,
    this.tipFirst = true,
  });
}
