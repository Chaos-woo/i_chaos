
import 'package:common_utils/common_utils.dart';
import 'package:floor/floor.dart';
import 'package:i_chaos/ichaos/public/base/database/root_entity.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';

@Entity(tableName: 'tb_todo')
class TodoEntity extends RootEntity<TodoVO>{
  // 内容
  final String content;
  // 实际生效时间
  @ColumnInfo(name: 'valid_time')
  final String? validTime;
  // 提醒时间
  @ColumnInfo(name: 'need_prompt_time')
  final String? needPromptTime;
  // 地点信息
  final String? location;
  // 事件等级
  final int level;
  // 是否已完成
  final bool completed;
  // 完成时间
  @ColumnInfo(name: 'completed_time')
  final String? completedTime;
  // 周期规则
  final int period;
  // 关联的分类id
  final int? tag;
  final String? remark;
  // 子任务json
  final String? subTask;
  // 调用日历提醒功能返回事件id
  @ColumnInfo(name: 'prompt_event_id')
  final String? promptEventId;

  TodoEntity(this.level, this.completed, this.period, {
    this.content = '', this.validTime, this.needPromptTime, this.location, this.completedTime, this.tag,
    this.subTask = '', this.remark = '', this.promptEventId, int? id, String? createTime, required String updateTime
  }) : super(id, updateTime, createTime: createTime);
  
  @override
  TodoVO fromEntity() {
    return TodoVO(id, validTime?.dateTime, createTime.dateTime, updateTime.dateTime, content, needPromptTime?.dateTime, location, level, completed, completedTime?.dateTime, period, tag, remark, deserializeSubTaskVO(subTask), promptEventId);
  }
  
  List<SubTaskVO> deserializeSubTaskVO(String? subTaskString) {
    return JsonUtil.getList(subTaskString) ?? [];
  }
}