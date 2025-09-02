import '../../data/models/titcket_model.dart';
import '../reporisatory/ticket_reporisatory.dart';

class GetMessagesUsecase {
  final TicketReporisatory ticketReporisatory;
  GetMessagesUsecase(this.ticketReporisatory);

  Future<List<ChattModel>> call() async {
    return await ticketReporisatory.getMessages();
  }
}
