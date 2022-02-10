import 'package:i_chaos/base_framework/view_model/list_view_state_model.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/tag_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/repository/tag_repository.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/units/sort_unit.dart';

/// 事件草稿列表视图模型
class TodoTagVM extends ListViewStateModel<TagVO> {
  // 标签列表
  late List<TagVO> _tagList;

  late TagRepository _tagRepo;

  TodoTagVM() {
    initMemoryTag();
    _tagRepo = TagRepository();
  }

  List<TagVO> get tagList => _tagList;

  @override
  Future<List<TagVO>?> loadData() {
    initMemoryTag();
    return _tagRepo.listTag();
  }

  @override
  onCompleted(List<TagVO> data) {
    _tagList = data;
    SortUnit.sortTag(_tagList);
  }

  // vm新建或刷新时需要先将内存列表重置
  void initMemoryTag() {
    _tagList = [];
  }

  void insertTag(TagVO tag) {
    _tagRepo.insertTag(tag);
  }

  Future<void> deleteTag(int id) async  {
    await _tagRepo.deleteTagById(id);
  }

  void updateTag(TagVO tag) {
    _tagRepo.updateTag(tag);
  }

  void updateTags(List<TagVO> tags) {
    _tagRepo.updateTags(tags);
  }

  Future<TagVO?> findByName(String name) async {
    return _tagRepo.findByName(name);
  }
}
