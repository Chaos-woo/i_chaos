import 'package:common_utils/common_utils.dart';
import 'package:i_chaos/ichaos/common-module/root-variable/database/to_entity_mixin.dart';
import 'package:i_chaos/ichaos/common-module/utils/random.dart';
import 'package:i_chaos/ichaos/common-module/utils/uuid.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/entity/todo_entity.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_level.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/subtask.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:i_chaos/ichaos/common-module/extensions/date_time_extension.dart';
import 'package:i_chaos/ichaos/common-module/root-variable/sorting/mult_sort_base.dart';

part 'todo_vo.g.dart';

@JsonSerializable()
class TodoVO extends MultiSortBase with SerializeVO<TodoEntity>{
  int? id;
  // 事件实际生效时间
  DateTime? validTime;
  // 创建时间
  DateTime createTime;
  // 更新时间
  DateTime updateTime;
  // 内容
  String content;
  // 地点信息
  String? location;
  // 事件等级
  int level;
  // 是否已完成
  bool completed;
  // 完成时间
  DateTime? completedTime;
  // 周期规则
  int period;
  // 关联的分类id
  int? tag;
  // 描述/备注
  String? remark;
  // 子任务json
  List<SubTaskVO> subTaskList;

  /// 系统日历功能
  // 提醒时间
  DateTime? needPromptTime;
  // 调用日历提醒功能返回事件id
  String? promptEventId;

  TodoVO(this.id, this.validTime, this.createTime, this.updateTime, this.content, this.needPromptTime, this.location, this.level, this.completed, this.completedTime,
      this.period, this.tag, this.remark, this.subTaskList, this.promptEventId);

  static TodoVO newTodo({DateTime? validTime, DateTime? createTime, DateTime? updateTime, required String content, DateTime? needPromptTime, String? location, int level = 2,
    int period = 0, int? tag, String? remark, List<SubTaskVO>? subTaskList, String? promptEventId}) {

    return TodoVO(null, validTime, createTime ?? DateTime.now(), updateTime ?? DateTime.now(), content, needPromptTime, location, level, false, null, period, tag, remark, subTaskList ?? [], promptEventId);
}

  factory TodoVO.fromJson(Map<String, dynamic> json) => _$TodoVOFromJson(json);

  Map<String, dynamic> toJson() => _$TodoVOToJson(this);

  @override
  Map<String, dynamic> toSortMap() {
    return <String, dynamic>{'id': id, 'needPromptTime': needPromptTime, 'level': level, 'validTime': validTime};
  }

  @override
  TodoEntity toEntity() {
    return TodoEntity(level, completed, period, updateTime: updateTime.yyyyMMddHHmmss,
      id: id,
      content: content,
      validTime: validTime?.yyyyMMddHHmmss,
      needPromptTime: needPromptTime?.yyyyMMddHHmmss,
      location: location,
      completedTime: completedTime?.yyyyMMddHHmmss,
      tag: tag,
      subTask: serializeSubTaskVO(subTaskList),
      remark: remark,
      promptEventId: promptEventId,
      createTime: createTime.yyyyMMddHHmmss
    );
  }

  String serializeSubTaskVO(List<SubTaskVO> subTasks) {
    return JsonUtil.encodeObj(subTasks)!;
  }

  @override
  String toString() {
    return 'TodoVO{id: $id, validTime: $validTime, createTime: $createTime, updateTime: $updateTime, content: $content, needPromptTime: $needPromptTime, location: $location, level: $level, completed: $completed, completedTime: $completedTime, period: $period, tag: $tag, remark: $remark, subTaskList: $subTaskList, promptEventId: $promptEventId}';
  }

  /// 卡片区域信息分布
  bool get isColorPrompt => level > TodoLevel.normal.code || level == TodoLevel.deferrable.code;
  bool get isPromptLocation => location != null && location != '';
  bool get isPromptDate => needPromptTime != null;
  bool get isMainContent => true;
  bool get isRemarkInfo => remark != null && remark!.trim() != '';
  bool get isSubTaskInfo => subTaskList.isNotEmpty;
  bool get isTagsPrompt => level > TodoLevel.normal.code || period > 0 || (tag != null && tag! > 0);

  static TodoVO empty() {
    return TodoVO.newTodo(content: '');
  }

  static TodoVO fakeTester() {
    List<SubTaskVO> tasks = [
      SubTaskVO.fakeTester(),
      SubTaskVO.fakeTester(),
      SubTaskVO.fakeTester(),
    ];
    TodoVO vo = TodoVO.newTodo(content: 'fake testing', subTaskList: tasks, remark: 'fake remark', validTime: DateTime.now());
    vo.id = RandomUnit.nextInt(0, 1000000);
    return vo;
  }

  TodoVO copyWith() {
    return TodoVO(id, validTime, createTime, updateTime, content, needPromptTime, location, level, completed, completedTime, period, tag, remark, subTaskList, promptEventId);
  }
}