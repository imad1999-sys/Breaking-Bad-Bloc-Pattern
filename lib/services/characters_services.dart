
import 'package:bloc_pattern_app/consts/base_url.dart';
import 'package:dio/dio.dart';

class CharactersServices {
  late Dio dio;

  CharactersServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCharacters() async{
    try{
      Response response = await dio.get("characters");
      print(response.data);
      return response.data;
    }catch(e){
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getCharacterQuotes(String characterName) async{
    try{
      Response response = await dio.get("quote" , queryParameters: {'author' : characterName});
      print(response.data);
      return response.data;
    }catch(e){
      print(e.toString());
      return [];
    }
  }

}
