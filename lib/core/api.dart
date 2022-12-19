import 'package:dio/dio.dart';

const kBaseUrl = 'https://api.themoviedb.org/3';
const kApiKey =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOWM5MWEzNDk3YzUzZjFiNzYyZGVkZDVjY2ZkNzBhZiIsInN1YiI6IjVmNjBjYjUzNzA2YjlmMDAzOTA3YTg3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rEOlSYuj_E0YlW1ZVOLXU4MaWXfEhS1hQtYev-qjF70";

const kServerErro = 'Failed to connect to the server. Try again later.';

final kDioOptions = BaseOptions(
    baseUrl: kBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
    headers: {'Authorization': 'Bearer $kApiKey'});
