import '../entities/event_entities.dart';
import '../reporisatory/event_reprisatory.dart';

class AddEventUsecase {
  final EventRepsitory eventRepsitory;

  AddEventUsecase(this.eventRepsitory);

  Future<BaseResponse> call(EventEntity eventEntity) async {
    return await eventRepsitory.addEvent(eventEntity);
  }
}
