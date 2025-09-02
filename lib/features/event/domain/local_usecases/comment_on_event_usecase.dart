import '../entities/event_entities.dart';
import '../reporisatory/event_reprisatory.dart';

class CommentOnEventUsecase {
  final EventRepsitory eventRepsitory;

  CommentOnEventUsecase(this.eventRepsitory);

  Future<BaseResponse> call(CommentEntity commentEntity) async {
    return await eventRepsitory.addComment(commentEntity);
  }
}
