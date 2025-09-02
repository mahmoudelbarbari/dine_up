import '../entities/event_entities.dart';
import '../reporisatory/event_reprisatory.dart';

class GetAllEventsUsecase {
  final EventRepsitory eventRepsitory;

  GetAllEventsUsecase(this.eventRepsitory);

  Future<List<EventEntity>> call() async {
    return await eventRepsitory.getAllEvents();
  }
}
