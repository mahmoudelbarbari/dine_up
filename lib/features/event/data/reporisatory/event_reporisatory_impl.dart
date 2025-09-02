import '../../domain/entities/event_entities.dart';
import '../../domain/reporisatory/event_reprisatory.dart';
import '../datasource/event_datasource.dart';
import '../models/event_model.dart';

class EventReporisatoryImpl implements EventRepsitory {
  final EventDatasourceImpl eventDatasourceImpl;

  EventReporisatoryImpl(this.eventDatasourceImpl);

  @override
  Future<BaseResponse> addEvent(EventEntity eventEntity) async {
    return await eventDatasourceImpl.addEvent(
      EventModel.fromEntity(eventEntity),
    );
  }

  @override
  Future<BaseResponse> deleteEvent(int id) async {
    return await eventDatasourceImpl.deleteEvent(id);
  }

  @override
  Future<List<EventEntity>> getAllEvents() async {
    return await eventDatasourceImpl.getAllEvent();
  }

  @override
  Future<List<CommentEntity>> getAllComment() async {
    return await eventDatasourceImpl.getAllComment();
  }

  @override
  Future<BaseResponse> updateEvent(EventEntity eventEntity) async {
    final EventModel eventModel = EventModel(
      id: eventEntity.id,
      title: eventEntity.title,
      description: eventEntity.description,
    );
    return await eventDatasourceImpl.updateEvent(eventModel, 'id');
  }

  @override
  Future<BaseResponse> addComment(CommentEntity commentEntity) async {
    return await eventDatasourceImpl.addComment(
      CommentModel.fromEntity(commentEntity),
    );
  }
}
