import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../domain/remote_usecases/get_messages_usecase.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  late GetMessagesUsecase getMessagesUsecase;
  ChatCubit() : super(ChatStateInt());

  Future<void> getChatData() async {
    try {
      getMessagesUsecase = sl();
      final allMessages = await getMessagesUsecase.call();
      emit(ChatLoadedState(messages: allMessages));
    } catch (e) {
      emit(ChatErrorState(errorMessage: e.toString()));
    }
  }
}
