import 'package:flutter_filmes/movies/movie_api.dart';
import 'package:flutter_filmes/utils/simple_bloc.dart';

class MoviesBloc extends SimpleBloc {

  Future fetch({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        add(null);
      }

      final movies = await MoviesApi.getMovies();

      add(movies);
      print("Movies: $movies");
      return movies;
    } catch (error) {
      print('Erro: $error');
      addError("Nenhum Filme !!!");
    }
  }
}