import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc_pattern_app/consts/colors.dart';
import 'package:bloc_pattern_app/logic/characters_bloc.dart';
import 'package:bloc_pattern_app/logic/characters_state.dart';
import 'package:bloc_pattern_app/models/character_model.dart';
import 'package:bloc_pattern_app/screens/details_screen/components/character_divider.dart';
import 'package:bloc_pattern_app/screens/details_screen/components/character_name_and_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../details_screen/components/character_info.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterModel characterModel;

  const CharacterDetails({required this.characterModel});

  Widget checkIfQuotesIsLoaded(CharactersState state) {
    if (state is QuotesIsLoaded) {
      return displayRandomQuotedOrEmptyText(state);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget displayRandomQuotedOrEmptyText(state) {
    var quotes = (state).characterQuotesModel;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70, fontSize: 20, shadows: [
            Shadow(
              blurRadius: 7,
              color: Colors.white70,
              offset: Offset(0, 0),
            ),
          ]),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex].quote)
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersBloc>(context)
        .getCharacterQuotes(characterModel.name);
    return CustomScrollView(
      slivers: [
        CharacterNameAndImage(nickname: characterModel.nickname, img: characterModel.img, charId: characterModel.charId),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CharacterInfo(
                      title: 'Job: ',
                      text: characterModel.occupation.join('/')),
                  CharacterDivider(endIntent: 295),
                  CharacterInfo(
                      title: 'Appeared In: ', text: characterModel.category),
                  CharacterDivider(endIntent: 245),
                  CharacterInfo(
                      title: 'Seasons: ',
                      text: characterModel.appearance.join('/')),
                  CharacterDivider(endIntent: 270),
                  CharacterInfo(title: 'Status: ', text: characterModel.status),
                  CharacterDivider(endIntent: 280),
                  characterModel.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : CharacterInfo(
                          title: 'Better Call Saul Seasons: ',
                          text: characterModel.betterCallSaulAppearance
                              .join('/')),
                  characterModel.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : CharacterDivider(endIntent: 150),
                  CharacterInfo(
                      title: 'Actor/Actress: ', text: characterModel.portrayed),
                  CharacterDivider(endIntent: 235),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<CharactersBloc, CharactersState>(
                      builder: (context, state) {
                    return checkIfQuotesIsLoaded(state);
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 500,
            ),
          ]),
        ),
      ],
    );
  }
}
