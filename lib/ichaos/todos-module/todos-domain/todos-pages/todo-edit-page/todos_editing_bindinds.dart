import 'package:i_chaos/base-getX-framework/get-x/bindings/getx_bindings_guider.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/todos_editing_ctrl.dart';

class TodosEditingBindings extends GetXBindingsGuider {
  @override
  void putBindingReferences() {
    TodoVO todo = argument<TodoVO>();
    lazyPutReference<TodosEditingCtrl>(TodosEditingCtrl(todo.copyWith()));
  }
}
