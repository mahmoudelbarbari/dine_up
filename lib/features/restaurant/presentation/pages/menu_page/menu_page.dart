import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_bar_widget.dart';
import '../../../../../core/widgets/snackbar_message.dart';
import '../../../../register/domain/entities/register_entities.dart';
import '../../cubit/restaurant_cubit.dart';
import '../../cubit/restaurant_state.dart';
import 'menu_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  RegisterAccountEntity registerAccountEntity = RegisterAccountEntity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        pageName: 'Add Menu Restaurant',
        centerTitle: false,
        hideBackButton: true,
      ),
      body: BlocProvider<RestaurantCubit>(
        create: (context) => RestaurantCubit(),
        child: BlocConsumer<RestaurantCubit, RestaurantState>(
          listener: (context, state) {
            if (state is CreateRestaurantSuccessfully) {
              registerAccountEntity = state.registerAccountEntity;
              FlutterToastMessageWidget().showSuccessFlutterToast(
                message:
                    state.registerAccountEntity.message ?? "Added Successfully",
                context: context,
              );
            }
            if (state is RestaurantError) {
              FlutterToastMessageWidget().showErrorFlutterToast(
                message: state.errorMessage,
                context: context,
              );
            }
          },
          builder: (context, state) {
            return const MenuWidget();
          },
        ),
      ),
    );
  }
}
