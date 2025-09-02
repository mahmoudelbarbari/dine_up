import '../../data/models/register_account_model.dart';
import '../../domain/entities/register_entities.dart';

abstract class RegisterState {}

class RegisteredState extends RegisterState {
  RegisteredState(registered);
}

class RegisterErrorState extends RegisterState {
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}

class RegisterStateInt extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class CreateUserSuccessfully extends RegisterState {
  RegisterAccountEntity registerAccountEntity;
  CreateUserSuccessfully({required this.registerAccountEntity});
}

// profile states
class ProfileSuccessState extends RegisterState {
  RegisterAccountModel registerAccountModel;
  ProfileSuccessState({required this.registerAccountModel});
}

class ProfileLoadingState extends RegisterState {}

class ProfileErrorState extends RegisterState {
  String errorMessage;
  ProfileErrorState({required this.errorMessage});
}
