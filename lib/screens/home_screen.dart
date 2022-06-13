import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search_outlined)
          )
        ],
        ),
      body:SingleChildScrollView( //Scroll para contenido largo en
       child:  Column(
        children: [

          //Tarjetas principales
          CardSwiper(),

          // Slider de peliculas
          MovieSlider(),

        ],
      )

      )
    );
  }
}