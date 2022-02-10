
// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

enum OptionGroupTipPosition {
  left,
  right
}

class OptionGroupTipTool {
  String? tip;
  Widget? tool;
  late OptionGroupTipPosition tipPosition;
  late OptionGroupTipPosition toolPosition;
  late bool tipFirst;

  OptionGroupTipTool({String? tip, Widget? tool, OptionGroupTipPosition tipPosition = OptionGroupTipPosition.left, OptionGroupTipPosition toolPosition = OptionGroupTipPosition.left,  bool tipFirst = true}) {
    this.tip = tip;
    this.tool = tool;
    this.tipPosition = tipPosition;
    this.toolPosition = toolPosition;
    this.tipFirst = tipFirst;
  }
}