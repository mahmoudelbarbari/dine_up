import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_bar_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/snackbar_message.dart';
import '../../cubit/menu_cubit.dart';
import '../../cubit/menu_state.dart';
import 'get_menu_widget.dart';

class AllMenuPage extends StatefulWidget {
  const AllMenuPage({super.key});

  @override
  State<AllMenuPage> createState() => _AllMenuPageState();
}

class _AllMenuPageState extends State<AllMenuPage> {
  _AllMenuPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(pageName: "Menu", centerTitle: false),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<MenuCubit, MenuState>(
          listener: (context, state) {
            if (state is MenuError) {
              if (kDebugMode) {
                print(state.errorMessage);
              }
            }
          },
          builder: (context, state) {
            if (state is MenuLoaded) {
              return AllMenuWidget(menuModel: state.menuModel);
            } else if (state is MenuError) {
              FlutterToastMessageWidget().showErrorFlutterToast(
                message: state.errorMessage,
                context: context,
              );
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}
