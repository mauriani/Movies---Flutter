import 'package:flutter/material.dart';
import 'package:movies/core/constant.dart';
import 'package:movies/pages/movie_page.dart';
import 'core/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: kThemeApp,
      home: const MoviePage(),
    );
  }
}
