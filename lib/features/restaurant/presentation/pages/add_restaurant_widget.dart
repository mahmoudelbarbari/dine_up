import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/common_elevated_button_widget.dart';
import '../../data/model/restaurant_model.dart';
import '../cubit/restaurant_cubit.dart';
import 'menu_page/menu_page.dart';
import 'widget/add_menu_button_widget.dart';
import 'widget/header_container_add_restaurant_widget.dart';
import 'widget/hotline_restaurant_textfield_widget.dart';
import 'widget/restaurant_textfield_widget.dart';

class RestaurantWidget extends StatefulWidget {
  const RestaurantWidget({super.key});

  @override
  State<RestaurantWidget> createState() => _RestaurantWidgetState();
}

class _RestaurantWidgetState extends State<RestaurantWidget> {
  bool isPressed = false;

  final TextEditingController controllerRestaurantname =
      TextEditingController();
  final TextEditingController _controllerRestaurantDescription =
      TextEditingController();
  final TextEditingController controllerRestaurantHotline =
      TextEditingController();
  late final GlobalKey<FormState> keyForm;

  @override
  void initState() {
    keyForm = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 12);
    const divider = Divider(
      thickness: 1,
      indent: 30,
      endIndent: 30,
      color: Colors.amber,
    );
    return Form(
      key: keyForm,
      child: ListView(
        children: [
          sizedBox,
          divider,
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UnderlineTextWidget(text: "- Restaurant Details."),
                sizedBox,
                RestaurantTextFieldWidget(
                  controllerRestaurant: controllerRestaurantname,
                  labelText: "Name",
                ),
                sizedBox,
                RestaurantTextFieldWidget(
                  controllerRestaurant: _controllerRestaurantDescription,
                  labelText: "Description",
                ),
                sizedBox,
                HotLineRestaurantTextFieldWidget(
                  controllerRestaurantHotline: controllerRestaurantHotline,
                ),
              ],
            ),
          ),
          sizedBox,
          divider,
          CommonElevatedButton(
            text: 'Upload restaurant picture',
            onTap: () {
              context.read<RestaurantCubit>().uploadImage();
            },
          ),
          isPressed == false
              ? CommonElevatedButton(
                  text: "Add restaurant",
                  onTap: () {
                    setState(() {
                      if (keyForm.currentState!.validate()) {
                        isPressed = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Restaurant added successfully"),
                          ),
                        );
                        context.read<RestaurantCubit>().addRestaurant(
                          RestaurantModel(
                            restaurantName: controllerRestaurantname.text,
                            restaurantDescription:
                                _controllerRestaurantDescription.text,
                            hotlineNum: controllerRestaurantHotline.text,
                          ),
                        );
                      }
                    });
                  },
                )
              : AddMenuButtonWidget(
                  onTap: () {
                    setState(() {
                      isPressed = false;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MenuPage(),
                        ),
                      );
                    });
                  },
                ),
        ],
      ),
    );
  }
}
