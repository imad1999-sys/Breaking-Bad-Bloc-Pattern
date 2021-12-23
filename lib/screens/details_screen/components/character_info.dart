import 'package:bloc_pattern_app/consts/colors.dart';
import 'package:flutter/material.dart';
class CharacterInfo extends StatelessWidget {
  final String title;
  final String text;

  const CharacterInfo({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontFamily: 'Baloo2 Regular'),
        ),
        TextSpan(
          text: text,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: textColor,
              fontFamily: 'Baloo2 Regular'),
        ),
      ]),
    );
  }
}
