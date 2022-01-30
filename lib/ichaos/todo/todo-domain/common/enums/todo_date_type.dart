
class TodoBtnDateType {
  final int code;
  final String desc;

  TodoBtnDateType._(this.code, this.desc);

  @override
  String toString() {
    return 'TodoDateType{code: $code, desc: $desc}';
  }

  static TodoBtnDateType today = TodoBtnDateType._(0, '今天');
  static TodoBtnDateType tomorrow = TodoBtnDateType._(1, '明天');
  static TodoBtnDateType selected = TodoBtnDateType._(2, '手动选择日期');
  static TodoBtnDateType storage = TodoBtnDateType._(3, '收纳箱');

  static List<TodoBtnDateType> values = [
    today, tomorrow, selected, storage
  ];

  bool isThisType(TodoBtnDateType type) {
    return code == type.code;
  }
}