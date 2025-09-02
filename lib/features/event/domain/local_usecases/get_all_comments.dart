import '../entities/event_entities.dart';
import '../reporisatory/event_reprisatory.dart';

class GetAllCommentsUsecase {
  final EventRepsitory eventRepsitory;

  GetAllCommentsUsecase(this.eventRepsitory);

  Future<List<CommentEntity>> call() async {
    return await eventRepsitory.getAllComment();
  }
}
