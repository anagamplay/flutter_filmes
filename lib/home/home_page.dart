import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_filmes/favoritos/favoritos_bloc.dart';
import 'package:flutter_filmes/favoritos/tab_favoritos.dart';
import 'package:flutter_filmes/home/drawer.dart';
import 'package:flutter_filmes/login/login_page.dart';
import 'package:flutter_filmes/movies/movies_bloc.dart';
import 'package:flutter_filmes/movies/tab_movies.dart';
import 'package:flutter_filmes/utils/nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => MoviesBloc()),
        Bloc((i) => FavoritosBloc()),
      ],
      dependencies: [],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Filmes"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: _onClickLogout,
            )
          ],
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: "Filmes",
                icon: Icon(Icons.movie),
              ),
              Tab(
                text: "Favoritos",
                icon: Icon(Icons.favorite),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            TabMovies(),
            TabFavoritos(),
          ],
        ),
        drawer: DrawerMenu(),
      ),
    );
  }

  _onClickLogout() {
    pushReplacement(context, LoginPage());
  }
}