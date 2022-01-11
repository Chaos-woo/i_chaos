
import 'package:i_chaos/ichaos/todo/todo-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';

/// 事件表单对象
class TodoDetailFormVO {
  static const String contentLabelText = "想干啥?";
  static const String descLabelText = "简单描述下，不然忘了!";
  static const String locationLabelText = "有个地点没?";

  static const String todayBtnText = "今日";
  static const String tomorrowBtnText = "明日";
  static const String chooseDateBtnText = "选择日期";
  static const String noDateBtnText = "放到草稿箱";

  TodoDetailFormVO.fromTodo(TodoVO vo) {
    _content = vo.content;
    _remark = vo.remark;
    _subTaskVOs = vo.subTaskList;
    _selectDate = vo.createTime; // todo：不对
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