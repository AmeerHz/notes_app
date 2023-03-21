import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.icon,
      this.onPressed,
      this.icon2});
  final String title;
  final IconData icon;
  final IconData? icon2;
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
        BlocProvider.of<NotesCubit>(context).isEdit
            ? Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CustomAppBarIcon(
                  onPressed: () {
                    BlocProvider.of<NotesCubit>(context).isEdit = false;
                    Navigator.pop(context);
                  },
                  icon: icon2!,
                ),
              )
            : const Spacer(),
        CustomAppBarIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
