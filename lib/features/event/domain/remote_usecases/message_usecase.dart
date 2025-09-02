import '../../../login/domain/entities/account_entites.dart' show Account;
import '../entities/event_entities.dart';
import '../reporisatory/ticket_reporisatory.dart';

class UploadMessageUsecase {
  final TicketReporisatory ticketReporisatory;
  UploadMessageUsecase(this.ticketReporisatory);

  Future<BaseResponse> call(
    String idUser,
    String message,
    Account account,
  ) async {
    return await ticketReporisatory.remoteUploadMessage(
      idUser,
      message,
      account,
    );
  }
}
