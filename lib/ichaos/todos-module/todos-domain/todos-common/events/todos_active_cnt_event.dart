import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/publishers/todos_event_publisher.dart';

class TodosActiveCntEvent {
  TodosEventPublisher publisher;

  TodosActiveCntEvent({
    required this.publisher,
  });
}
