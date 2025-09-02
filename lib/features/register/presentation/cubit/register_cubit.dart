import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/handler_request_api.dart';
import '../../../../injection_container.dart';
import '../../data/models/register_account_model.dart';
import '../../domain/entities/register_entities.dart';
import '../../domain/usecase/get_user_info_usecase.dart';
import '../../domain/usecase/register_usecase.dart';
import '../../domain/usecase/remote_register_usecase.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  late RegisterUsecase registerUsecase;

  RegisterCubit() : super(RegisterStateInt());

  Future<void> registerAccountFromRemote(
    BuildContext context, {
    required String email,
    required String password,
    required RegisterAccountEntity registerAccountEntity,
  }) async {
    emit(RegisterLoadingState());
    final remoteRegisterUsecase = RemoteRegisterUsecase(sl());

    try {
      handlerRequestApi(
        context: context,
        body: () async {
          await remoteRegisterUsecase(email, password, registerAccountEntity);
          emit(
            CreateUserSuccessfully(
              registerAccountEntity: registerAccountEntity,
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      emit(RegisterErrorState(errorMessage: e.message.toString()));
    }
  }

  Future<void> registerAccount(RegisterAccountEntity registerAccount) async {
    try {
      emit(RegisterLoadingState());

      final registered = await registerUsecase.call(registerAccount);
      if (registered.status) {
        emit(RegisteredState(registered));
      } else {
        emit(RegisterErrorState(errorMessage: registered.message));
      }
    } catch (e) {
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getUserInfo(RegisterAccountModel registerAccountModel) async {
    try {
      emit(ProfileLoadingState());
      final getUserInfoUsecase = GetUserInfoUsecase(sl());
      final userInfo = await getUserInfoUsecase.call();
      if (userInfo.replyCode == 200) {
        emit(ProfileSuccessState(registerAccountModel: registerAccountModel));
      } else {
        emit(ProfileErrorState(errorMessage: userInfo.message ?? ''));
      }
    } catch (e) {
      emit(ProfileErrorState(errorMessage: e.toString()));
    }
  }
}
