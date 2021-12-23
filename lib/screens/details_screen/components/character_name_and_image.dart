import 'package:bloc_pattern_app/consts/colors.dart';
import 'package:flutter/material.dart';

class CharacterNameAndImage extends StatelessWidget {
  final String nickname;
  final String img;
  final int charId;

  const CharacterNameAndImage({required this.nickname, required this.img, required this.charId});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      stretch: true,
      pinned: true,
      backgroundColor: cardColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          nickname,
          style: TextStyle(color: titleColor, fontFamily: 'Baloo2 Regular'),
        ),
        background: Hero(
          tag: charId,
          child: Image.network(
            img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
