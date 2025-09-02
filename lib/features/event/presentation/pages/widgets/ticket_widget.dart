import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../restaurant/presentation/pages/get_all_restaurants_page/all_restaurants_page.dart';
import '../../../domain/entities/event_entities.dart';
import '../../cubit/ticket_cubit.dart';
import 'custome_row_home_widget.dart';
import 'get_restaurant_row_widget.dart';
import 'tickets_list_title_widget.dart';

class TicketWidget extends StatefulWidget {
  final List<EventEntity> eventEntity;
  const TicketWidget({Key? key, required this.eventEntity}) : super(key: key);

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  Future<void> _refresh() async {
    setState(() {
      context.read<TicketCubit>().getAllTickets();
    });
    return await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    const divider = Divider(thickness: 1, height: 3);
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomRowHomePage(
            firstText: 'Resturant',
            scoindText: 'SeeMore',
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AllRestaurantPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          const GetRestaurantRowWidget(),
          divider,
          Flexible(
            flex: 3,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.eventEntity.length,
              itemBuilder: (context, index) {
                return TicketsListTitleWidget(
                  title: widget.eventEntity[index].title ?? '',
                  subTitle: widget.eventEntity[index].description ?? '',
                  eventEntity: widget.eventEntity[index],
                );
              },
              separatorBuilder: (context, index) => divider,
            ),
          ),
        ],
      ),
    );
  }
}
