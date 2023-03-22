import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xffF0F0F0);
const kNotesBox = 'notes_box';

const List<Color> kColors = [
  Color(0xfffcca46),
  Color(0xff233d4d),
  Color(0xffd90429),
  Color(0xff8d99ae),
  Color(0xfffe7f2d),
  Color(0xff38b000),
  Color(0xffa1c181),
  Color(0xff619b8a),
  Color(0xffef233c),
];

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black.withOpacity(0.5),
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          message,
          style: const TextStyle(
            color : kPrimaryColor,
            fontSize: 17,
          ),
        ),
      ),
    ),
  );
}
