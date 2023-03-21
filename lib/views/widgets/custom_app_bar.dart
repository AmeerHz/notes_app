import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/custom_app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 32,
          ),
        ),
        const Spacer(),
        CustomAppBarIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
