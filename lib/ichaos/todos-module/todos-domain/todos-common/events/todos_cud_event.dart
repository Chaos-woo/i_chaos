
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/publishers/todos_event_publisher.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';

enum TodoCudType { create, update, delete }

class CudTodo {
  final TodoCudType type;
  final TodoVO todo;

  CudTodo(this.type, this.todo);
}

class TodosCreateOrDeleteEvent {
  final TodosEventPublisher publisher;
  late List<CudTodo> todos;

  TodosCreateOrDeleteEvent(this.publisher, this.todos);

  TodosCreateOrDeleteEvent.single(this.publisher, TodoVO todo, TodoCudType type) {
    CudTodo pak = CudTodo(type, todo);
    todos = [pak];
  }

  TodosCreateOrDeleteEvent.singleCreate(this.publisher, TodoVO todo) {
    CudTodo pak = CudTodo(TodoCudType.create, todo);
    todos = [pak];
  }

  TodosCreateOrDeleteEvent.singleDelete(this.publisher, TodoVO todo) {
    CudTodo pak = CudTodo(TodoCudType.delete, todo);
    todos = [pak];
  }
}

class TodosUpdateEvent {
  final TodosEventPublisher publisher;
  final TodoVO todo;

  TodosUpdateEvent(this.publisher, this.todo);
}