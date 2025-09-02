import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../cubit/event_cubit.dart';
import '../cubit/event_state.dart';
import 'event_widget.dart';
import 'widgets/event_add_update_pages/event_add_update_page.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

String greetings() {
  final hour = TimeOfDay.now().hour;

  if (hour <= 12) {
    return 'Good Morning';
  } else if (hour <= 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome, ${greetings()}')),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocConsumer<EventCubit, EventState>(
        listener: (context, state) {
          if (state is EventErrorState) {
            final snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is EventLoadingState) {
            return const LoadingWidget();
          } else if (state is EventLoadedState) {
            return EventWidget(eventEntity: state.eventEntity);
          } else if (state is EventErrorState) {
            final snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const EventAddUpdatePage(isUpdateEvent: false),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
