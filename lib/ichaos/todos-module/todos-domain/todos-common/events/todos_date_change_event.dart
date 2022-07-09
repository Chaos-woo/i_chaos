import 'package:i_chaos/ichaos/common-module/extensions/date_time_extension.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/publishers/todos_event_publisher.dart';

// Todos选择日期变更事件
class TodosDateChangeEvent {
  final DateTime selectedDate;
  final DateTime? lastSelectedDate;
  final TodosEventPublisher publisher;

  TodosDateChangeEvent({
    required this.selectedDate,
    required this.publisher,
    this.lastSelectedDate,
  });

  bool isSameDay() {
    if (null == lastSelectedDate) {
      return false;
    }

    return selectedDate.isSameDay(lastSelectedDate!);
  }
}
