// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chaos_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorChaosDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ChaosDatabaseBuilder databaseBuilder(String name) =>
      _$ChaosDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ChaosDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ChaosDatabaseBuilder(null);
}

class _$ChaosDatabaseBuilder {
  _$ChaosDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ChaosDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ChaosDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ChaosDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ChaosDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ChaosDatabase extends ChaosDatabase {
  _$ChaosDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TodoDao? _todoDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tb_todo` (`content` TEXT NOT NULL, `valid_time` TEXT, `need_prompt_time` TEXT, `location` TEXT, `level` INTEGER NOT NULL, `completed` INTEGER NOT NULL, `completed_time` TEXT, `period` INTEGER NOT NULL, `tag` INTEGER, `remark` TEXT, `subTask` TEXT, `prompt_event_id` TEXT, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `create_time` TEXT NOT NULL, `update_time` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TodoDao get todoDao {
    return _todoDaoInstance ??= _$TodoDao(database, changeListener);
  }
}

class _$TodoDao extends TodoDao {
  _$TodoDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _todoEntityInsertionAdapter = InsertionAdapter(
            database,
            'tb_todo',
            (TodoEntity item) => <String, Object?>{
                  'content': item.content,
                  'valid_time': item.validTime,
                  'need_prompt_time': item.needPromptTime,
                  'location': item.location,
                  'level': item.level,
                  'completed': item.completed ? 1 : 0,
                  'completed_time': item.completedTime,
                  'period': item.period,
                  'tag': item.tag,
                  'remark': item.remark,
                  'subTask': item.subTask,
                  'prompt_event_id': item.promptEventId,
                  'id': item.id,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                }),
        _todoEntityUpdateAdapter = UpdateAdapter(
            database,
            'tb_todo',
            ['id'],
            (TodoEntity item) => <String, Object?>{
                  'content': item.content,
                  'valid_time': item.validTime,
                  'need_prompt_time': item.needPromptTime,
                  'location': item.location,
                  'level': item.level,
                  'completed': item.completed ? 1 : 0,
                  'completed_time': item.completedTime,
                  'period': item.period,
                  'tag': item.tag,
                  'remark': item.remark,
                  'subTask': item.subTask,
                  'prompt_event_id': item.promptEventId,
                  'id': item.id,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TodoEntity> _todoEntityInsertionAdapter;

  final UpdateAdapter<TodoEntity> _todoEntityUpdateAdapter;

  @override
  Future<TodoEntity?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM tb_todo WHERE id=?1',
        mapper: (Map<String, Object?> row) => TodoEntity(row['level'] as int,
            (row['completed'] as int) != 0, row['period'] as int,
            content: row['content'] as String,
            validTime: row['valid_time'] as String?,
            needPromptTime: row['need_prompt_time'] as String?,
            location: row['location'] as String?,
            completedTime: row['completed_time'] as String?,
            tag: row['tag'] as int?,
            subTask: row['subTask'] as String?,
            remark: row['remark'] as String?,
            promptEventId: row['prompt_event_id'] as String?,
            id: row['id'] as int?,
            createTime: row['create_time'] as String?,
            updateTime: row['update_time'] as String),
        arguments: [id]);
  }

  @override
  Future<List<TodoEntity>> list() async {
    return _queryAdapter.queryList('SELECT * FROM tb_todo',
        mapper: (Map<String, Object?> row) => TodoEntity(row['level'] as int,
            (row['completed'] as int) != 0, row['period'] as int,
            content: row['content'] as String,
            validTime: row['valid_time'] as String?,
            needPromptTime: row['need_prompt_time'] as String?,
            location: row['location'] as String?,
            completedTime: row['completed_time'] as String?,
            tag: row['tag'] as int?,
            subTask: row['subTask'] as String?,
            remark: row['remark'] as String?,
            promptEventId: row['prompt_event_id'] as String?,
            id: row['id'] as int?,
            createTime: row['create_time'] as String?,
            updateTime: row['update_time'] as String));
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM tb_todo WHERE id=?1', arguments: [id]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM tb_todo');
  }

  @override
  Future<void> deleteAllOfDay(String start, String end) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM tb_todo WHERE createTime >= strftime(\'%Y-%m-%d %H:%M:%S\', ?1) and createTime <= strftime(\'%Y-%m-%d %H:%M:%S\', ?2)',
        arguments: [start, end]);
  }

  @override
  Future<List<TodoEntity>> listByTime(String start, String end) async {
    return _queryAdapter.queryList(
        'SELECT * FROM tb_todo WHERE createTime >= strftime(\'%Y-%m-%d %H:%M:%S\', ?1) and createTime <= strftime(\'%Y-%m-%d %H:%M:%S\', ?2)',
        mapper: (Map<String, Object?> row) => TodoEntity(row['level'] as int, (row['completed'] as int) != 0, row['period'] as int, content: row['content'] as String, validTime: row['valid_time'] as String?, needPromptTime: row['need_prompt_time'] as String?, location: row['location'] as String?, completedTime: row['completed_time'] as String?, tag: row['tag'] as int?, subTask: row['subTask'] as String?, remark: row['remark'] as String?, promptEventId: row['prompt_event_id'] as String?, id: row['id'] as int?, createTime: row['create_time'] as String?, updateTime: row['update_time'] as String),
        arguments: [start, end]);
  }

  @override
  Future<int> insertTodo(TodoEntity todo) {
    return _todoEntityInsertionAdapter.insertAndReturnId(
        todo, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateTodo(TodoEntity todo) {
    return _todoEntityUpdateAdapter.updateAndReturnChangedRows(
        todo, OnConflictStrategy.abort);
  }
}
