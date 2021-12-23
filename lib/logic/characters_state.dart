import 'package:bloc_pattern_app/models/character_model.dart';
import 'package:bloc_pattern_app/models/character_quotes_model.dart';
import 'package:equatable/equatable.dart';

class CharactersState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialState extends CharactersState{}

class CharactersIsLoaded extends CharactersState{
  final List<CharacterModel> characters;

  CharactersIsLoaded(this.characters);
}

class ErrorState extends CharactersState{}

class CharactersIsLoading extends CharactersState{}


class QuotesIsLoaded extends CharactersState{
  final List<CharacterQuotesModel> characterQuotesModel;

  QuotesIsLoaded(this.characterQuotesModel);

}