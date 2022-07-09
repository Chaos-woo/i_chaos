import 'package:flutter/material.dart';

class TodoLevel {
  final int code;
  final String desc;
  final String title;
  final MaterialColor color;

  TodoLevel._(this.code, this.desc, this.title, this.color);

  @override
  String toString() => 'TodoLevel:[$code],$desc,$title';

  static TodoLevel deferrable = TodoLevel._(0, 'deferrable', '可延期', Colors.grey);
  static TodoLevel unimportant = TodoLevel._(1, 'unimportant', '不重要', Colors.green);
  static TodoLevel normal = TodoLevel._(2, 'normal', '普通', Colors.lightBlue);
  static TodoLevel important = TodoLevel._(3, 'important', '重要', Colors.orange);
  static TodoLevel urgent = TodoLevel._(4, 'urgent', '紧急', Colors.red);

  static List<TodoLevel> values = [
    deferrable, unimportant, normal, important, urgent
  ];

  static TodoLevel named(String desc) {
    return values.firstWhere((item) => item.desc == desc);
  }

  static TodoLevel coded(int code) {
    if (code >= 0 || code < values.length) {
      for (TodoLevel val in values) {
        if (val.code == code) return val;
      }
    }
    return normal;
  }

  bool isThisLevel(TodoLevel level) {
    return code == level.code;
  }
}