import 'package:bloc_pattern_app/logic/characters_event.dart';
import 'package:bloc_pattern_app/logic/characters_state.dart';
import 'package:bloc_pattern_app/models/character_model.dart';
import 'package:bloc_pattern_app/repository/characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersBloc extends Cubit<CharactersState>{
  final CharactersRepository charactersRepository;
  List<CharacterModel> characters = [];
  CharactersBloc(this.charactersRepository) : super(InitialState());

  List<CharacterModel> getAllCharacters(){
    charactersRepository.getAllCharacters().then((characters){
      emit(CharactersIsLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getCharacterQuotes(String characterName){
    charactersRepository.getCharacterQuotes(characterName).then((charactersQuote){
      emit(QuotesIsLoaded(charactersQuote));
    });
  }
}