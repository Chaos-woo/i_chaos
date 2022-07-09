
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/publishers/todos_event_publisher.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';

enum TodoCudType { create, update, delete }

class CudTodo {
  final TodoCudType type;
  final TodoVO todo;

  CudTodo(this.type, this.todo);
}

class TodosCudEvent {
  final TodosEventPublisher publisher;
  late List<CudTodo> todos;

  TodosCudEvent(this.publisher, this.todos);

  TodosCudEvent.single(this.publisher, TodoVO todo, TodoCudType type) {
    CudTodo pak = CudTodo(type, todo);
    todos = [pak];
  }

  TodosCudEvent.singleCreate(this.publisher, TodoVO todo) {
    CudTodo pak = CudTodo(TodoCudType.create, todo);
    todos = [pak];
  }

  TodosCudEvent.singleUpdate(this.publisher, TodoVO todo) {
    CudTodo pak = CudTodo(TodoCudType.update, todo);
    todos = [pak];
  }

  TodosCudEvent.singleDelete(this.publisher, TodoVO todo) {
    CudTodo pak = CudTodo(TodoCudType.delete, todo);
    todos = [pak];
  }
}