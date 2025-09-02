import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_bar_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../cubit/restaurant_cubit.dart';
import '../../cubit/restaurant_state.dart';
import 'all_restaurants_widget.dart';

class AllRestaurantPage extends StatefulWidget {
  const AllRestaurantPage({super.key});

  @override
  State<AllRestaurantPage> createState() => _AllRestaurantPageState();
}

class _AllRestaurantPageState extends State<AllRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(pageName: "Restaurants", centerTitle: false),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<RestaurantCubit, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantLoading) {
              return const LoadingWidget();
            } else if (state is RestaurantLoadedState) {
              return AllRestaurantWidget(
                restaurantModel: state.restaurantModel,
              );
            } else if (state is RestaurantError) {
              if (kDebugMode) {
                print(state.errorMessage);
              }
            }
            return const LoadingWidget();
          },
          listener: (context, state) {
            if (state is RestaurantError) {
              if (kDebugMode) {
                print(state.errorMessage);
              }
            }
          },
        ),
      ),
    );
  }
}
