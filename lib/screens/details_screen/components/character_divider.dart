import 'package:flutter/material.dart';

class CharacterDivider extends StatelessWidget {
  final double endIntent;

  const CharacterDivider({required this.endIntent});
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      thickness: 2,
      endIndent: endIntent,
      color: Colors.yellowAccent,
    );
  }
}
