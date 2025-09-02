import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_bar_widget.dart';
import '../../data/models/register_account_model.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';
import 'widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  RegisterAccountModel registerAccountModel = RegisterAccountModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(pageName: 'Profile', centerTitle: false),
      body: BlocProvider<RegisterCubit>(
        create: (_) => RegisterCubit()..getUserInfo(registerAccountModel),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is ProfileSuccessState) {
              registerAccountModel = state.registerAccountModel;
            } else if (state is ProfileErrorState) {
              if (kDebugMode) {
                print(state.errorMessage);
              }
            }
          },
          builder: (context, state) {
            return ProfileWidget(registerAccountModel: registerAccountModel);
          },
        ),
      ),
    );
  }
}
