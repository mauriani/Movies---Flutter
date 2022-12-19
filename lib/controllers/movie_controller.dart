import 'package:dartz/dartz.dart';

import '../erros/movie_error.dart';
import '../models/movie_model.dart';
import '../models/movie_response_model.dart';
import '../repositories/movie_repository.dart';

class MovieController {
  final _repository = MovieRepository();

  MovieResponseModel? movieResponseModel;
  MovieError? movieError;
  bool loading = true;

  List<MovieModel> get movies => movieResponseModel?.movies ?? <MovieModel>[];

  int get moviesCount => movies.length;
  bool get hasMovie => moviesCount != 0;
  int get totalPages => movieResponseModel?.totalPages ?? 1;
  int get currentPage => movieResponseModel?.page ?? 1;

  Future<Either<MovieError, MovieResponseModel>> fetchAllMovies(
      int page) async {
    movieError = null;

    var result = await _repository.fetchAllMovies(page);

    // ignore: avoid_print
    print('fetchAllMovies');

    result.fold((error) => movieError = error, (movie) {
      if (movieResponseModel == null) {
        movieResponseModel = movie;
      } else {
        movieResponseModel?.page = movie.page;
        movieResponseModel?.movies.addAll(movie.movies);
      }
    });

    return result;
  }
}
