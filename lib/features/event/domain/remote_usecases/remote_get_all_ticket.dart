import '../entities/event_entities.dart';
import '../reporisatory/ticket_reporisatory.dart';

class GetAllTicketUsecase {
  final TicketReporisatory ticketReporisatory;
  GetAllTicketUsecase(this.ticketReporisatory);

  Future<List<EventEntity>> call() async {
    return await ticketReporisatory.remoteGetAllTickets();
  }
}
