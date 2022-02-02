
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/entity/todo_entity.dart';
import '../../../todo/todo-infrastructure/repository/todo_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'chaos_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [TodoEntity])
abstract class ChaosDatabase extends FloorDatabase {
  TodoDao get todoDao;
}