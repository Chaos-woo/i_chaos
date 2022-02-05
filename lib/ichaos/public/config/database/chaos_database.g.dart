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

  TagDao? _tagDaoInstance;

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
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tb_tag` (`name` TEXT NOT NULL, `color_rgba` TEXT NOT NULL, `order` INTEGER NOT NULL, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `create_time` TEXT NOT NULL, `update_time` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TodoDao get todoDao {
    return _todoDaoInstance ??= _$TodoDao(database, changeListener);
  }

  @override
  TagDao get tagDao {
    return _tagDaoInstance ??= _$TagDao(database, changeListener);
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
  Future<void> deleteByIds(List<int> ids) async {
    const offset = 1;
    final _sqliteVariablesForIds =
        Iterable<String>.generate(ids.length, (i) => '?${i + offset}')
            .join(',');
    await _queryAdapter.queryNoReturn(
        'DELETE FROM tb_todo WHERE id in (' + _sqliteVariablesForIds + ')',
        arguments: [...ids]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM tb_todo');
  }

  @override
  Future<void> deleteAllOfDay(String start, String end) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM tb_todo WHERE valid_time >= ?1 and valid_time <= ?2',
        arguments: [start, end]);
  }

  @override
  Future<List<TodoEntity>> listByTime(String start, String end) async {
    return _queryAdapter.queryList(
        'SELECT * FROM tb_todo WHERE valid_time >= ?1 and valid_time <= ?2',
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
        arguments: [start, end]);
  }

  @override
  Future<List<TodoEntity>> listByNoValidTime() async {
    return _queryAdapter.queryList(
        'SELECT * FROM tb_todo WHERE valid_time is null or valid_time = \'\'',
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

class _$TagDao extends TagDao {
  _$TagDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _tagEntityInsertionAdapter = InsertionAdapter(
            database,
            'tb_tag',
            (TagEntity item) => <String, Object?>{
                  'name': item.name,
                  'color_rgba': item.colorRGBA,
                  'order': item.order,
                  'id': item.id,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                }),
        _tagEntityUpdateAdapter = UpdateAdapter(
            database,
            'tb_tag',
            ['id'],
            (TagEntity item) => <String, Object?>{
                  'name': item.name,
                  'color_rgba': item.colorRGBA,
                  'order': item.order,
                  'id': item.id,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TagEntity> _tagEntityInsertionAdapter;

  final UpdateAdapter<TagEntity> _tagEntityUpdateAdapter;

  @override
  Future<TagEntity?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM tb_tag WHERE id=?1',
        mapper: (Map<String, Object?> row) => TagEntity(
            row['name'] as String, row['color_rgba'] as String,
            order: row['order'] as int,
            id: row['id'] as int?,
            createTime: row['create_time'] as String?,
            updateTime: row['update_time'] as String),
        arguments: [id]);
  }

  @override
  Future<List<TagEntity>> list() async {
    return _queryAdapter.queryList('SELECT * FROM tb_tag',
        mapper: (Map<String, Object?> row) => TagEntity(
            row['name'] as String, row['color_rgba'] as String,
            order: row['order'] as int,
            id: row['id'] as int?,
            createTime: row['create_time'] as String?,
            updateTime: row['update_time'] as String));
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM tb_tag WHERE id=?1', arguments: [id]);
  }

  @override
  Future<void> deleteByIds(List<int> ids) async {
    const offset = 1;
    final _sqliteVariablesForIds =
        Iterable<String>.generate(ids.length, (i) => '?${i + offset}')
            .join(',');
    await _queryAdapter.queryNoReturn(
        'DELETE FROM tb_tag WHERE id in (' + _sqliteVariablesForIds + ')',
        arguments: [...ids]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM tb_tag');
  }

  @override
  Future<int> insertTag(TagEntity tag) {
    return _tagEntityInsertionAdapter.insertAndReturnId(
        tag, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateTodo(TagEntity tag) {
    return _tagEntityUpdateAdapter.updateAndReturnChangedRows(
        tag, OnConflictStrategy.abort);
  }
}
