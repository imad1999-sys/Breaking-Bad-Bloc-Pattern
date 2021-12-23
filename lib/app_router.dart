import 'package:bloc_pattern_app/consts/colors.dart';
import 'package:bloc_pattern_app/logic/characters_bloc.dart';
import 'package:bloc_pattern_app/models/character_model.dart';
import 'package:bloc_pattern_app/repository/characters_repository.dart';
import 'package:bloc_pattern_app/routes/routes.dart';
import 'screens/details_screen/character_details.dart';
import 'screens/main_screen/characters_screen.dart';
import 'package:bloc_pattern_app/services/characters_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersBloc charactersBloc;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersServices());
    charactersBloc = CharactersBloc(charactersRepository);
  }

  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case charactersScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersBloc,
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreenRoute:
        final character = routeSettings.arguments as CharacterModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersBloc,
            child: CharacterDetails(characterModel: character),
          ),
        );
    }
  }
}
