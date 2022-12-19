import 'package:flutter/material.dart';

import '../controllers/movie_detail_controller.dart';
import '../widgets/centered_message.dart';
import '../widgets/centered_progress.dart';
import '../widgets/chip_date.dart';
import '../widgets/rate.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _controller = MovieDetailController();

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchMovieById(widget.movieId);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMovieDetail(),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(_controller.movieDetail?.title ?? ''),
    );
  }

  _buildMovieDetail() {
    if (_controller.loading) {
      return const CenteredProgress();
    }

    if (_controller.movieError != null) {
      // Dessa forma, você promete ao dardo que é impossível ser nulo
      return CenteredMessage(message: _controller.movieError!.message);
    }

    print(_controller.movieError);

    //   inspect(movieDetail.toString());
    return ListView(
      children: [
        _buildCover(),
        _buildStatus(),
        _buildOverview(),
      ],
    );
  }

  _buildStatus() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Rate(value: _controller.movieDetail?.voteAverage),
          ChipDate(date: _controller.movieDetail!.releaseDate)
        ],
      ),
    );
  }

  _buildOverview() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        _controller.movieDetail!.overview,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  _buildCover() {
    return Image.network(
        'https://image.tmdb.org/t/p/w500${_controller.movieDetail?.backdropPath}');
  }
}
