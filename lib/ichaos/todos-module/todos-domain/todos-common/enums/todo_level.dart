import 'package:flutter/material.dart';

class TodoLevel {
  final int code;
  final String desc;
  final MaterialColor color;
  final IconData icon;

  static const int newTodoDefaultLevel = 0;

  TodoLevel._(this.code, this.desc, this.color, this.icon);

  static TodoLevel first =
  TodoLevel._(0, 'urgent and important', Colors.red, Icons.local_fire_department);
  static TodoLevel second =
  TodoLevel._(1, 'urgent but unimportant', Colors.orange, Icons.access_alarm);
  static TodoLevel third =
  TodoLevel._(2, 'important but not urgent', Colors.lightBlue, Icons.event);
  static TodoLevel last =
      TodoLevel._(3, 'unimportant and not urgent', Colors.grey, Icons.alarm_off);

  static List<TodoLevel> values = [first, second, third, last];

  static TodoLevel coded(int code) {
    if (code >= 0 || code < values.length) {
      for (TodoLevel val in values) {
        if (val.code == code) return val;
      }
    }
    return second;
  }

  bool isThisLevel(TodoLevel level) {
    return code == level.code;
  }
}
