import 'package:bloc_pattern_app/consts/colors.dart';
import 'package:bloc_pattern_app/models/character_model.dart';
import 'package:bloc_pattern_app/routes/routes.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final CharacterModel characterModel;

  const CharacterItem({required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreenRoute,
            arguments: characterModel),
        child: GridTile(
          child: Hero(
            tag: characterModel.charId,
            child: Container(
              child: characterModel.img.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loading.gif',
                      image: characterModel.img,
                    )
                  : Image.network(
                      "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.black54,
            child: Text(
              characterModel.name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontFamily: 'Baloo2 Regular'),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
