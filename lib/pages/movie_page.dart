import 'package:flutter/material.dart';
import 'package:movies/core/constant.dart';
import 'package:movies/pages/movie_detail_page.dart';

import '../controllers/movie_controller.dart';
import '../widgets/centered_message.dart';
import '../widgets/centered_progress.dart';
import '../widgets/movie_card.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final _controller = MovieController();
  final _scrollController = ScrollController();
  int lastPage = 1;

  @override
  void initState() {
    _initScrollListener();
    _initialize();
    super.initState();
  }

  _initScrollListener() {
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        if (_controller.currentPage == lastPage) {
          // ignore: avoid_print
          print('to aqui');

          setState(() {
            lastPage++;
          });
          // ignore: avoid_print
          print(lastPage.toString());

          await _controller.fetchAllMovies(lastPage);
        }
      }
    });
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchAllMovies(lastPage);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMovieGrid(),
    );
  }

  _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: const Text(kAppName),
      actions: [
        IconButton(onPressed: _initialize, icon: const Icon(Icons.refresh))
      ],
    );
  }

  _buildMovieGrid() {
    if (_controller.loading) {
      return const CenteredProgress();
    }

    if (_controller.movieError != null) {
      // Dessa forma, você promete ao dardo que é impossível ser nulo
      return CenteredMessage(message: _controller.movieError!.message);
    }

    return GridView.builder(
      controller: _scrollController,
      itemCount: _controller.moviesCount,
      padding: const EdgeInsets.all(15.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          childAspectRatio: 0.65,
          crossAxisSpacing: 8),
      itemBuilder: _buildMovieCard,
    );
  }

  Widget _buildMovieCard(context, index) {
    final movie = _controller.movies[index];

    return MovieCard(
        posterPath: movie.posterPath, onTap: () => _openDetailPage(movie.id));
  }

  _openDetailPage(movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: ((context) => MovieDetailPage(
                movieId: movieId,
              ))),
    );
  }
}
