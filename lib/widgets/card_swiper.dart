import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({
    Key? key,
    required this.movies
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;

    if ( this.movies.length == 0){
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator() ,
          ),

      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width  * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _ ,int index) {

          final movie= movies[index];
          //print(movie.fullPosterImg);
          movie.heroId = 'swiper-${ movie.id}';

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!, // el tag debe ser unico, un string un boleano etc
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  FadeInImage(
                  //placeholder: NetworkImage('http://via.placeholder.com/300x400'),
                  //image: NetworkImage('http://via.placeholder.com/300x400')
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage( movie.fullPosterImg ),
                  fit: BoxFit.cover,
                  ),
              ),
            ),
          );

        } ,
        )
    );
  }
}