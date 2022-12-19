import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  final Function() onTap;

  const MovieCard({super.key, required this.posterPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w220_and_h330_face$posterPath')))),
    );
  }
}
