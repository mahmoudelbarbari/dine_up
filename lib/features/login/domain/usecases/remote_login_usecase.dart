import '../entities/account_entites.dart';
import '../repositories/account_repository.dart';

class RemoteLoginUsecase {
  final AccountRepository accountRepository;
  RemoteLoginUsecase(this.accountRepository);

  Future<LoginBaseResponse> call(String email, String password) async {
    return await accountRepository.remoteLogin(email, password);
  }
}
