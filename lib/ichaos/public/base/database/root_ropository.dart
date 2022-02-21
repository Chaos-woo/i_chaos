import 'package:floor/floor.dart';
import 'package:i_chaos/ichaos/public/config/database/chaos_database.dart';
import 'package:i_chaos/ichaos/public/global.dart';
import 'package:i_chaos/ichaos/todo/todo-infrastructure/repository/tag_dao.dart';
import 'package:i_chaos/ichaos/todo/todo-infrastructure/repository/todo_dao.dart';

/// 基础仓库抽象，提供DAO对象获取，抽取获取database行为
abstract class RootRepository {
  Future<ChaosDatabase>? _singleDbInstance;

  Future<void> _creteTableTagV2(database) async {
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `tb_tag` (`name` TEXT NOT NULL, `color_rgba` TEXT NOT NULL, `order` INTEGER NOT NULL, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `create_time` TEXT NOT NULL, `update_time` TEXT NOT NULL)');
  }

  late final Callback _callback = Callback(
    onCreate: (database, version) { /* database has been created */ },
    onOpen: (database) { /* database has been opened */},
    onUpgrade: (database, oldVersion, newVersion) {
      /* database has been upgraded */
      if (oldVersion == 1) {
        _creteTableTagV2(database);
      }
    },);

  Future<ChaosDatabase> _getDatabase() async {
    if (_singleDbInstance != null) {
      return _singleDbInstance!;
    }
    ChaosDatabase instance = await $FloorChaosDatabase.databaseBuilder(appDatabaseName).addCallback(_callback).build();
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