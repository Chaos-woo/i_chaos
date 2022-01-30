
import 'package:i_chaos/ichaos/public/base/database/root_ropository.dart';
import 'package:i_chaos/ichaos/public/scenes/error_code.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/entity/todo_entity.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/todo_vo.dart';

/// 事件数据仓库
class TodoRepository extends RootRepository {
  Future<List<TodoVO>> listTodo({DateTime? start, DateTime? end}) async {
    final todoDao = await getTodoDao();
    List<TodoEntity> todoEntities = [];
    if (start == null && end == null) {
      todoEntities = await todoDao.list();
    } else if (start != null && end != null) {
      todoEntities = await todoDao.listByTime(start.beginPoint.yyyyMMddHHmmss, end.endPoint.yyyyMMddHHmmss);
    }
    return todoEntities.map((entity) => entity.fromEntity()).toList();
  }

  Future<int> insertTodo(TodoVO vo) async {
    final todoDao = await getTodoDao();
    return await todoDao.insertTodo(vo.toEntity());
  }

  Future<int> updateTodo(TodoVO vo) async {
    final todoDao = await getTodoDao();
    return await todoDao.updateTodo(vo.toEntity());
  }

  Future<void> deleteTodoById(TodoVO vo) async {
    final todoDao = await getTodoDao();
    if(vo.id != null) {
      todoDao.deleteById(vo.id!);
    } else {
      throw Exception(ErrorCode.internalCodeError.customToString());
    }
  }

  Future<void> deleteAllTodo({DateTime? start, DateTime? end}) async {
    final todoDao = await getTodoDao();
    if (start == null && end == null) {
      todoDao.deleteAll();
    } else if (start != null && end != null) {
      todoDao.deleteAllOfDay(start.yyyyMMddHHmmss, end.yyyyMMddHHmmss);
    } else if (start != null && end == null) {
      todoDao.deleteAllOfDay(start.yyyyMMddHHmmss, DateTime.now().yyyyMMddHHmmss);
    }
  }
}