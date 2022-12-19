import 'dart:convert';

import 'movie_model.dart';

// guarda informações da página,
//quantidade de filmes, quantidade de páginas
//e a lista de MovieModel.

class MovieResponseModel {
  int page;
  final int totalResults;
  final int totalPages;
  final List<MovieModel> movies;

  MovieResponseModel({
    required this.movies,
    required this.page,
    required this.totalResults,
    required this.totalPages,
  });

  factory MovieResponseModel.fromJSON(String str) =>
      MovieResponseModel.fromMap(json.decode(str));

  factory MovieResponseModel.fromMap(Map<String, dynamic> json) =>
      MovieResponseModel(
          page: json["page"],
          totalResults: json["totalResults"] ?? 0,
          totalPages: json["totalPages"] ?? 0,
          movies: List<MovieModel>.from(
              json["results"].map((x) => MovieModel.fromMap(x))));
}
