import 'dart:convert';

class ProductionCompanyModel {
  ProductionCompanyModel({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  factory ProductionCompanyModel.fromJson(String str) =>
      ProductionCompanyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductionCompanyModel.fromMap(Map<String, dynamic> json) =>
      ProductionCompanyModel(
        id: json["id"],
        logoPath: json["logo_path"] ?? '',
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}
