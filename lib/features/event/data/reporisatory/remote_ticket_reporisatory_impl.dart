import '../../../login/domain/entities/account_entites.dart';
import '../../domain/entities/event_entities.dart';
import '../../domain/reporisatory/ticket_reporisatory.dart';
import '../datasource/remote_ticket_datasource.dart';
import '../models/event_model.dart';
import '../models/titcket_model.dart';

class TicketReporisatoryImlp implements TicketReporisatory {
  final TicketDatasourceInterface remoteTicketDatasource;
  TicketReporisatoryImlp(this.remoteTicketDatasource);

  @override
  Future<BaseResponse> remoteAddTicket(EventEntity eventEntity) async {
    return await remoteTicketDatasource.remoteAddTicket(
      EventModel.fromEntity(eventEntity),
    );
  }

  @override
  Future<BaseResponse> remoteDeleteTicket() async {
    return await remoteTicketDatasource.remoteDeleteTicket();
  }

  @override
  Future<List<EventEntity>> remoteGetAllTickets() async {
    return await remoteTicketDatasource.remoteGetAllTickets();
  }

  @override
  Future<BaseResponse> remoteUpdateTicket(EventEntity eventEntity) async {
    final EventModel eventModel = EventModel(
      title: eventEntity.title!,
      description: eventEntity.description!,
    );
    return await remoteTicketDatasource.remoteUpdateTicket(eventModel);
  }

  @override
  Future<BaseResponse> remoteUploadMessage(
    String idUser,
    String message,
    Account account,
  ) async {
    return await remoteTicketDatasource.uploadMessage(idUser, message, account);
  }

  @override
  Future<List<ChattModel>> getMessages() async {
    return await remoteTicketDatasource.getAllMessages();
  }
}
