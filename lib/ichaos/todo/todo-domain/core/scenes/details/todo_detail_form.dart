
// ignore_for_file: unnecessary_getters_setters

import 'package:i_chaos/ichaos/todo/todo-domain/common/models/subtask.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/todo_vo.dart';

/// 事件表单对象
class TodoFormBO {
  static const String contentLabelText = "想干啥?";
  static const String descLabelText = "简单描述下，不然忘了!";
  static const String locationLabelText = "有个地点没?";

  static const String todayBtnText = "今日";
  static const String tomorrowBtnText = "明日";
  static const String chooseDateBtnText = "选择日期";
  static const String noDateBtnText = "草稿箱";

  TodoFormBO.fromTodo(TodoVO vo) {
    _content = vo.content;
    _remark = vo.remark;
    _subTaskVOs = vo.subTaskList;
    _selectDate = vo.validTime;
    _level = vo.level;
    _location = vo.location;
  }

  // 内容
  late String _content;
  // 描述
  late String? _remark;
  // 子任务
  late List<SubTaskVO> _subTaskVOs;
  // 选择日期
  late DateTime? _selectDate;
  // 事件等级
  late int _level;
  // 地点
  late String? _location;

  // 转换为TodoVO
  TodoVO newValidTodo() {
    TodoVO vo = TodoVO.empty();
    DateTime now = DateTime.now();
    vo.content = _content;
    vo.createTime = now;
    vo.updateTime = now;
    vo.location = _location;
    vo.completed = false;
    vo.completedTime = null;
    vo.period = 0;
    vo.remark = _remark;
    vo.subTaskList = _subTaskVOs;

    vo.validTime = _selectDate;
    vo.level = _level;

    return vo;
  }

  // 将表单中的数据更新至对象中
  TodoVO copyWithTodo(TodoVO ori) {
    TodoVO copy = ori.copyWith();

    copy.content = _content;
    copy.updateTime = DateTime.now();
    copy.location = _location;
    copy.remark = _remark;
    copy.subTaskList = _subTaskVOs;

    copy.validTime = _selectDate;
    copy.level = _level;

    return copy;
  }

  // 校验字段
  bool check() {
    return _content.isNotEmpty && _content.trim() != ''
        && _level >= 0;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String get remark => _remark ?? '';

  set remark(String value) {
    _remark = value;
  }

  List<SubTaskVO> get subTaskVOs => _subTaskVOs;

  set subTaskVOs(List<SubTaskVO> value) {
    _subTaskVOs = value;
  }

  String get location => _location ?? '';

  set location(String value) {
    _location = value;
  }

  int get level => _level;

  set level(int value) {
    _level = value;
  }

  DateTime? get selectedDate => _selectDate;

  set selectDate(DateTime? value) {
    _selectDate = value;
  }

  @override
  String toString() {
    return 'TodoDetailFormVO{_content: $_content, _remark: $_remark, _subTaskVOs: $_subTaskVOs, _selectDate: $_selectDate, _level: $_level, _location: $_location}';
  }
}