
// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

typedef TagMenuItemCallback = void Function(List<dynamic> args);

enum TagMenuFlag {
  edit, delete, sort
}

class TagMenuItem {
  String title;
  IconData icon;
  Color color;
  TagMenuFlag flag;
  TagMenuItemCallback? onTap;

  TagMenuItem(this.title, this.icon, this.color, this.flag, {TagMenuItemCallback? onTap}) {
    this.onTap = onTap;
  }
}