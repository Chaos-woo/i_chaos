
import 'package:i_chaos/base_framework/view_model/single_view_state_model.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';

/// 事件草稿列表视图模型
class DraftListVM extends SingleViewStateModel<List<TodoVO>> {
  @override
  Future<List<TodoVO>>? loadData() {

    return Future.value([]);
  }

  @override
  onCompleted(List<TodoVO> data) {
  }

}