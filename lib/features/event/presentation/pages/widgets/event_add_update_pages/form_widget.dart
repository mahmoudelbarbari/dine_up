import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../../../core/persistent_bottom_nav_bar_widget.dart';
import '../../../../domain/entities/event_entities.dart';
import '../../../cubit/ticket_cubit.dart';
import 'form_submit_btn.dart';
import 'text_form_field_widget.dart';

class FormWidget extends StatefulWidget {
  final EventEntity? eventEntity;
  final bool isUpdateEvent;
  const FormWidget({
    Key? key,
    required this.eventEntity,
    required this.isUpdateEvent,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdateEvent) {
      titleController.text = widget.eventEntity!.title!;
      descriptionController.text = widget.eventEntity!.description!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormFieldWidget(
                name: "Title",
                multiLines: false,
                controller: titleController,
              ),
              TextFormFieldWidget(
                name: "Body",
                multiLines: true,
                controller: descriptionController,
              ),
              FormSubmitBtn(
                isUpdateEvent: widget.isUpdateEvent,
                onPressed: () {
                  validateFormThenUpdateOrAddPost();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void validateFormThenUpdateOrAddPost() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      Fluttertoast.showToast(
        msg: "You created an ticket successfully",
        backgroundColor: Colors.green,
      );
      final eventEntity = EventEntity(
        id: widget.isUpdateEvent ? widget.eventEntity!.id : null,
        title: titleController.text,
        description: descriptionController.text,
      );
      Get.to(() => const NavBarWidget());

      if (widget.isUpdateEvent) {
        BlocProvider.of<TicketCubit>(context).updateTicket(eventEntity);
      } else {
        BlocProvider.of<TicketCubit>(context).addTicket(eventEntity);
      }
    }
  }
}
