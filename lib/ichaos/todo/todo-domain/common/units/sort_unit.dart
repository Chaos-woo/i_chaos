import 'package:i_chaos/ichaos/public/extension/mult_sort_extension.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/enums/todo_sort_rule.dart';
import '../models/todo_vo.dart';

///
/// Todo排序工具
///
class SortUnit {
  static List<TodoVO> sort(List<TodoVO> todoList, List<int>? orders) {
    if (todoList.isEmpty) {
      return todoList;
    }

    if (orders == null || orders.length != TodoSortRule.defaultTodoSortRules.length) {
      orders = TodoSortRule.defaultTodoSortRulesOrderIds;
    }

    List<TodoSortRule> rules = TodoSortRule.rulesByOrderIds(orders);
    // 升降序标准，目前全为降序
    List<bool> rawPropsAscCriteria = [
      for (int i = 0; i < TodoSortRule.defaultTodoSortRules.length; i++) false,
    ];
    // Todo类的属性名
    List<String> rawProps = [
      for (int i = 0; i < rules.length; i++) rules[i].propName,
    ];
    todoList.multiPropSort(rawPropsAscCriteria, rawProps);
    return todoList;
  }
}
