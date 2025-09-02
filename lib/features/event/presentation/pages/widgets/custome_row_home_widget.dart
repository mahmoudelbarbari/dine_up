import 'package:flutter/material.dart';

import '../../../../../core/theme_app.dart';

class CustomRowHomePage extends StatelessWidget {
  final String firstText;
  final String scoindText;
  final Function? press;

  const CustomRowHomePage({
    super.key,
    required this.firstText,
    required this.scoindText,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstText,
          style: TextStyle(
            color: Theme.of(context).textTheme.displayLarge!.color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            scoindText,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
