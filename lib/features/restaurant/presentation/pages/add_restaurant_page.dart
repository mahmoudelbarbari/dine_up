import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/snackbar_message.dart';
import '../../../register/domain/entities/register_entities.dart';
import '../cubit/restaurant_cubit.dart';
import '../cubit/restaurant_state.dart';
import 'add_restaurant_widget.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  RegisterAccountEntity registerAccountEntity = RegisterAccountEntity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        pageName: "Add restaurants",
        centerTitle: false,
      ),
      body: BlocProvider<RestaurantCubit>(
        create: (context) => RestaurantCubit(),
        child: BlocConsumer<RestaurantCubit, RestaurantState>(
          listener: (context, state) {
            if (state is CreateRestaurantSuccessfully) {
              FlutterToastMessageWidget().showSuccessFlutterToast(
                message: "Restaurant added seccessfuly :)",
                context: context,
              );
              registerAccountEntity = state.registerAccountEntity;
            }

            if (state is RestaurantError) {
              FlutterToastMessageWidget().showErrorFlutterToast(
                message: "You must choose an image..!",
                context: context,
              );
            }
          },
          builder: (context, state) {
            return const RestaurantWidget();
          },
        ),
      ),
    );
  }
}
