import '../../../login/domain/entities/account_entites.dart';
import '../../data/models/titcket_model.dart';
import '../entities/event_entities.dart';

abstract class TicketReporisatory {
  Future<List<EventEntity>> remoteGetAllTickets();
  Future<BaseResponse> remoteAddTicket(EventEntity eventEntity);
  Future<BaseResponse> remoteUpdateTicket(EventEntity eventEntity);
  Future<BaseResponse> remoteDeleteTicket();
  Future<BaseResponse> remoteUploadMessage(
    String idUser,
    String message,
    Account account,
  );
  Future<List<ChattModel>> getMessages();
}
