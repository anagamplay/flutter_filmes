import 'package:flutter_filmes/movies/api_key.dart';
import 'package:flutter_filmes/movies/movie.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MoviesApi {
  static bool FAKE = false;

  static Future<List<Movie>> getMovies() async {
//    await Future.delayed(Duration(seconds: 5));

    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=$api_key&language=pt-BR");
    print("> get: $url");

    final response = await http.get(url);
    String json = response.body;

    // Parser
    final map = convert.json.decode(json);
    print("< json: $map");

    final mapMovies = map["results"];

    List<Movie> movies =
        mapMovies.map<Movie>((json) => Movie.fromJson(json)).toList();

    print("MOVIES: $movies");
    return movies;
  }
}
