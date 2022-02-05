import 'package:i_chaos/ichaos/public/config/database/chaos_database.dart';
import 'package:i_chaos/ichaos/public/global.dart';
import 'package:i_chaos/ichaos/todo/todo-infrastructure/repository/tag_dao.dart';
import 'package:i_chaos/ichaos/todo/todo-infrastructure/repository/todo_dao.dart';

/// 基础仓库抽象，提供DAO对象获取，抽取获取database行为
abstract class RootRepository {
  Future<ChaosDatabase>? _singleDbInstance;

  Future<ChaosDatabase> _getDatabase() async {
    if (_singleDbInstance != null) {
      return _singleDbInstance!;
    }
    ChaosDatabase instance = await $FloorChaosDatabase.databaseBuilder(appDatabaseName).build();
    _singleDbInstance = Future.value(instance);
    return _singleDbInstance!;
  }

  Future<TodoDao> getTodoDao() async {
    final database = await _getDatabase();
    return database.todoDao;
  }

  Future<TagDao> getTagDao() async {
    final database = await _getDatabase();
    return database.tagDao;
  }
}