
import 'package:floor/floor.dart';
import 'package:i_chaos/ichaos/todo/todo-common/entity/todo_entity.dart';

const String _todoEntityTableName = 'tb_todo';

@dao
abstract class TodoDao {
  @insert
  Future<int> insertTodo(TodoEntity todo);

  @Query('SELECT * FROM $_todoEntityTableName WHERE id=:id')
  Future<TodoEntity?> findById(int id);

  @Query('SELECT * FROM tb_todo')
  Future<List<TodoEntity>> list();

  @Query('DELETE FROM $_todoEntityTableName WHERE id=:id')
  Future<void> deleteById(int id);

  @Query('DELETE FROM $_todoEntityTableName')
  Future<void> deleteAll();

  @Query("DELETE FROM $_todoEntityTableName WHERE createTime >= strftime('%Y-%m-%d %H:%M:%S', :start) and createTime <= strftime('%Y-%m-%d %H:%M:%S', :end)")
  Future<void> deleteAllOfDay(String start, String end);

  @Query("SELECT * FROM $_todoEntityTableName WHERE createTime >= strftime('%Y-%m-%d %H:%M:%S', :start) and createTime <= strftime('%Y-%m-%d %H:%M:%S', :end)")
  Future<List<TodoEntity>> listByTime(String start, String end);

  @update
  Future<int> updateTodo(TodoEntity todo);
}