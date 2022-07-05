import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);



    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: MovieSerachDelegate()),
            icon: const Icon(Icons.search_outlined)
          )
        ],
        ),
      body:SingleChildScrollView( //Scroll para contenido largo en
       child:  Column(
        children: [

          //Tarjetas principales
          CardSwiper( movies: moviesProvider.onDisplayMovies ),

          // Slider de peliculas
          MovieSlider(
            movies: moviesProvider.popularMovies,
            title: 'Populares',
           // onNextPage: () => print('Hola mundo'), Cuando este lleagndo el scrol a -500 lanzara el mensaje de prueba
           onNextPage: () => moviesProvider.getPopularMovies(),

          ),

        ],
      )

      )
    );
  }
}