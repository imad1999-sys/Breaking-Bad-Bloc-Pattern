import 'package:bloc_pattern_app/models/character_model.dart';
import 'package:bloc_pattern_app/models/character_quotes_model.dart';
import 'package:bloc_pattern_app/services/characters_services.dart';

class CharactersRepository{
  final CharactersServices charactersServices;

  CharactersRepository(this.charactersServices);

  Future<List<CharacterModel>> getAllCharacters() async{
    final characters = await charactersServices.getAllCharacters();
    return characters.map((character) => CharacterModel.fromJson(character)).toList();
  }
  Future<List<CharacterQuotesModel>> getCharacterQuotes(String characterName) async{
    final characterQuotes = await charactersServices.getCharacterQuotes(characterName);
    return characterQuotes.map((characterQuotes) => CharacterQuotesModel.fromJson(characterQuotes)).toList();
  }

}