

import 'package:i_chaos/ichaos/common-module/root-variable/database/root_ropository.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/entity/tag_entity.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/tag_vo.dart';


/// 标签数据仓库
class TagRepository extends RootRepository {
  Future<List<TagVO>> listTag() async {
    final tagDao = await getTagDao();
    List<TagEntity> tagEntities = await tagDao.list();
    return tagEntities.map((entity) => entity.toVO()).toList();
  }

  Future<int> insertTag(TagVO vo) async {
    final tagDao = await getTagDao();
    return await tagDao.insertTag(vo.toEntity());
  }

  Future<int> updateTag(TagVO vo) async {
    final tagDao = await getTagDao();
    return await tagDao.updateTag(vo.toEntity());
  }

  Future<int> updateTags(List<TagVO> vos) async {
    final tagDao = await getTagDao();
    return await tagDao.updateTags(vos.map((vo) => vo.toEntity()).toList());
  }

  Future<void> deleteTagById(int id) async {
    final tagDao = await getTagDao();
    tagDao.deleteById(id);
  }

  Future<TagVO?> findByName(String name) async {
    final tagDao = await getTagDao();
    TagEntity? entity = await tagDao.findByName(name);
    return entity?.toVO();
  }
}
