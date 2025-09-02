import '../entities/event_entities.dart';
import '../reporisatory/event_reprisatory.dart';

class UpdateEventUsecase {
  final EventRepsitory eventRepsitory;

  UpdateEventUsecase(this.eventRepsitory);

  Future<BaseResponse> call(EventEntity eventEntity) async {
    return await eventRepsitory.updateEvent(eventEntity);
  }
}
