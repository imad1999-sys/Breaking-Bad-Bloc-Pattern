// To parse this JSON data, do
//
//     final characterQuotesModel = characterQuotesModelFromJson(jsonString);

import 'dart:convert';

List<CharacterQuotesModel> characterQuotesModelFromJson(String str) => List<CharacterQuotesModel>.from(json.decode(str).map((x) => CharacterQuotesModel.fromJson(x)));

String characterQuotesModelToJson(List<CharacterQuotesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CharacterQuotesModel {
  CharacterQuotesModel({
    required this.quoteId,
    required this.quote,
  });

  int quoteId;
  String quote;

  factory CharacterQuotesModel.fromJson(Map<String, dynamic> json) => CharacterQuotesModel(
    quoteId: json["quote_id"],
    quote: json["quote"],
  );

  Map<String, dynamic> toJson() => {
    "quote_id": quoteId,
    "quote": quote,
  };
}




