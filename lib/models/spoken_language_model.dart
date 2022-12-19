import 'dart:convert';

class SpokenLanguageModel {
  SpokenLanguageModel({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String englishName;
  final String iso6391;
  final String name;

  factory SpokenLanguageModel.fromJson(String str) =>
      SpokenLanguageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SpokenLanguageModel.fromMap(Map<String, dynamic> json) =>
      SpokenLanguageModel(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
