import '../entities/account_entites.dart';
import '../repositories/account_repository.dart';

class RemoteLogoutUsecase {
  final AccountRepository accountRepository;
  RemoteLogoutUsecase(this.accountRepository);

  Future<LoginBaseResponse> call() async {
    return await accountRepository.remoteLogout();
  }
}
