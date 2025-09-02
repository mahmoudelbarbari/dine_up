import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/presentation/pages/cart_page.dart';
import '../cubit/ticket_cubit.dart';
import '../cubit/ticket_state.dart';
import '../pages/widgets/ticket_widget.dart';
import 'widgets/empty_list_widget.dart';
import 'widgets/ticket_page_app_bar_title_widget.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Badge(
            child: IconButton(
              onPressed: () {
                context.read<CartCubit>().getAllCartItems();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
        title: const TicketPageAppBarTitleWidget(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocConsumer<TicketCubit, TicketState>(
        listener: (context, state) {
          if (state is TicketErrorState) {
            if (kDebugMode) {
              print(state.errorMessage);
            }
          }
        },
        builder: (context, state) {
          if (state is TicketLoadedState) {
            if (state.eventEntity.isEmpty) {
              return const TicketEmptyListWidget();
            } else {
              return TicketWidget(eventEntity: state.eventEntity);
            }
          } else if (state is TicketErrorState) {
            if (kDebugMode) {
              print(state.errorMessage);
            }
          }
          return const LoadingWidget();
        },
      ),
    );
  }
}
