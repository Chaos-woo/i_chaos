
import 'package:floor/floor.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/entity/tag_entity.dart';

const String _tagEntityTableName = 'tb_tag';

@dao
abstract class TagDao {
  @insert
  Future<int> insertTag(TagEntity tag);

  @Query('SELECT * FROM $_tagEntityTableName WHERE id=:id')
  Future<TagEntity?> findById(int id);

  @Query('SELECT * FROM $_tagEntityTableName')
  Future<List<TagEntity>> list();

  @Query('DELETE FROM $_tagEntityTableName WHERE id=:id')
  Future<void> deleteById(int id);

  @Query('DELETE FROM $_tagEntityTableName WHERE id in (:ids)')
  Future<void> deleteByIds(List<int> ids);

  @Query('DELETE FROM $_tagEntityTableName')
  Future<void> deleteAll();

  @update
  Future<int> updateTodo(TagEntity tag);
}