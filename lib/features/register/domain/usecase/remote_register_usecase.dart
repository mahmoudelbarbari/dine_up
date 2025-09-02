import '../entities/register_entities.dart';
import '../reposisatory/register_reprisatory.dart';

class RemoteRegisterUsecase {
  final RegisterAccountRepository _registerAccountRepository;

  RemoteRegisterUsecase(this._registerAccountRepository);

  Future<RegisterAccountEntity> call(
    String email,
    String password,
    RegisterAccountEntity registerAccountEntity,
  ) async {
    return await _registerAccountRepository.remoteRegisterUser(
      email,
      password,
      registerAccountEntity,
    );
  }
}
