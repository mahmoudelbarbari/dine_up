import '../entities/event_entities.dart';
import '../reporisatory/ticket_reporisatory.dart';

class DeleteTicketUsecase {
  final TicketReporisatory ticketReporisatory;
  DeleteTicketUsecase(this.ticketReporisatory);

  Future<BaseResponse> call() async {
    return await ticketReporisatory.remoteDeleteTicket();
  }
}
