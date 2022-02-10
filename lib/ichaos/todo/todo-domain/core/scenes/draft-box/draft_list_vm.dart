import 'package:i_chaos/base_framework/view_model/list_view_state_model.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/repository/todo_repository.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';

/// 事件草稿列表视图模型
class DraftListVM extends ListViewStateModel<TodoVO> {
  // 草稿事件列表
  late List<TodoVO> _draftTodoList;

  // 草稿事件映射: 创建时间→草稿列表
  late Map<String, List<TodoVO>> _draftTodoMap;
  late List<String> _draftTodoMapOrderKeys;

  late TodoRepository _todoRepo;

  DraftListVM() {
    initMemoryDraft();
    _todoRepo = TodoRepository();
  }

  int get draftListCnt => _draftTodoList.length;
  List<TodoVO> get draftList => _draftTodoList;
  Map<String, List<TodoVO>> get draftTodoMap => _draftTodoMap;
  List<String> get draftTodoMapOrderKeys => _draftTodoMapOrderKeys;

  @override
  Future<List<TodoVO>?> loadData() {
    initMemoryDraft();
    return _todoRepo.listDraft();
  }

  @override
  onCompleted(List<TodoVO> data) {
    _draftTodoList = data;
    draftListReorganized();
  }

  // 清除所有草稿
  void deleteDraftByIds(List<int> ids) {
    _todoRepo.deleteByIds(ids);
  }

  // 删除草稿
  void deleteDraft(int id) {
    _todoRepo.deleteTodoById(id);
  }

  // vm新建或刷新时需要先将本地列表重置
  void initMemoryDraft() {
    _draftTodoList = [];
    _draftTodoMapOrderKeys = [];
    _draftTodoMap = {};
  }

  // 草稿二次整理
  void draftListReorganized() {
    if (_draftTodoList.isEmpty) {
      return;
    }

    Map<String, List<TodoVO>> tempDraftMap = {};

    // 将草稿根据创建时间保存在临时map中
    for (int i = 0; i < _draftTodoList.length; i++) {
      TodoVO vo = _draftTodoList[i];
      DateTime createTime = vo.createTime;
      List<TodoVO>? draft = tempDraftMap[createTime.yyyyMMdd];
      if (draft == null) {
        draft = [vo];
      } else {
        draft.add(vo);
      }
      tempDraftMap[createTime.yyyyMMdd] = draft;
    }

    // 整理每个日期中的草稿
    for (var entry in tempDraftMap.entries) {
      entry.value.sort((TodoVO a, TodoVO b) => a.createTime.isAfter(b.createTime) ? 1 : -1);
      tempDraftMap[entry.key] = entry.value;
    }

    // 将草稿map和排序后的创建时间key保存到成员变量
    _draftTodoMap = tempDraftMap;

    _draftTodoMapOrderKeys = tempDraftMap.keys.toList();
    _draftTodoMapOrderKeys.sort((String a, String b) => a.compareTo(b));
  }
}
