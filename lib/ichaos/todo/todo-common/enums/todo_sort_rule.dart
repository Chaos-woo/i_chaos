class TodoSortRule {
  final int id;
  final String propName;
  final String desc;

  TodoSortRule._(this.id, this.propName, this.desc);

  @override
  String toString() {
    return 'SortRule{id: $id, desc: $desc}';
  }

  static TodoSortRule todoLevel = TodoSortRule._(0, 'level', '重要程度');
  static TodoSortRule needPromptTime = TodoSortRule._(1, 'needPromptTime', '提醒时间');
  static TodoSortRule location = TodoSortRule._(2, 'location', '地点信息');
  static TodoSortRule validTime = TodoSortRule._(3, 'validTime', '有效时间');
  static TodoSortRule idOfTodo = TodoSortRule._(4, 'id', '创建id');

  static List<TodoSortRule> defaultTodoSortRules = [
    todoLevel, needPromptTime, location, validTime, idOfTodo
  ];

  static List<TodoSortRule> _values = [
    todoLevel, needPromptTime, location, validTime, idOfTodo
  ];

  /// 规则设置
  static void configSortRule(List<int> ruleIds) {
    _values = rulesByOrderIds(ruleIds);
    // todo: 用户设置保存
  }

  static TodoSortRule getById(int id) {
    for (TodoSortRule val in _values) {
      if (val.id == id) {
        return val;
      }
    }
    throw Exception("not found sort rule by id: $id");
  }

  static List<int> defaultTodoSortRulesOrderIds = [
    for(int i=0; i<defaultTodoSortRules.length; i++) defaultTodoSortRules[i].id,
  ];

  static List<TodoSortRule> rulesByOrderIds(List<int> ids) {
    if (ids.length != defaultTodoSortRules.length) {
//      throw new Exception("ids length too long");
      return [...defaultTodoSortRules];
    }

    List<TodoSortRule> orders = [];
    for (int id in ids) {
      orders.add(getById(id));
    }

    return orders;
  }
}