
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/entity/tag_entity.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/entity/todo_entity.dart';
import 'package:i_chaos/ichaos/todo/todo-infrastructure/repository/tag_dao.dart';
import 'package:i_chaos/ichaos/todo/todo-infrastructure/repository/todo_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'chaos_database.g.dart'; // the generated code will be there

///
/// 新增表操作：
/// 1.新增entity类
/// 2.新增对应的vo类
/// 3.新增对应的dao类(基础操作)
/// 4.新增对应的repository类(业务)
/// 5.在此处新增对应的类
/// 6.RootRepository类增加对应的dao类获取
/// 7.参考https://stackoverflow.com/questions/63347032/how-do-you-upgrade-a-flutter-app-with-sqlite-database编写数据库(root_repository.dart)升级回调(onCreate不需要处理，floor框架已自动生成)
/// 8.@Database版本号更改
/// *.执行命令：flutter packages pub run build_runner build --delete-conflicting-outputs
///

@Database(version: 2, entities: [TodoEntity, TagEntity])
abstract class ChaosDatabase extends FloorDatabase {
  TodoDao get todoDao;
  TagDao get tagDao;
}