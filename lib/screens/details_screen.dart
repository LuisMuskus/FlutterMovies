import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';


class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

     // ignore: todo
     //TODO: Cambiar por una instancia de movie
     final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

     return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              CastingCards()            
              ])
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: Text(
            'movie.title',
            style: TextStyle( fontSize: 16),
            
            ),
        ),
        background: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/500x300') ,
            fit: BoxFit.cover,
          ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme= Theme.of(context).textTheme;

    return Container(

      margin: EdgeInsets.only( top: 20 ),
      padding: EdgeInsets.symmetric( horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,

              ),
          ),

          SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title', 
              style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              ),
              Text('movie.originalTitle', 
              style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, color: Colors.yellow),
                  SizedBox( width: 5),
                  Text('movie.voteAverage', style: textTheme.caption)

                ],
              ),
            ],
          )

        ],
        
        ),


    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text("Lorem veniam id sunt culpa culpa eu exercitation nisi veniam do ipsum. Esse esse dolore nostrud pariatur proident. Cillum consequat officia pariatur enim occaecat. Incididunt cillum aliquip exercitation dolor pariatur. Pariatur in nisi consectetur in excepteur deserunt laborum sunt mollit occaecat ut excepteur anim do. Ut Lorem ex enim cupidatat reprehenderit occaecat reprehenderit elit exercitation consequat. Eiusmod sint nisi do non est in sunt non eiusmod aute. Deserunt ea nulla mollit ea laboris consequat id consequat sit incididunt anim quis. Pariatur magna ad voluptate deserunt laboris laboris enim id tempor. Irure anim consectetur mollit do Lorem ipsum sint aliqua laboris laboris eiusmod consequat aliquip nisi. Velit ea aute est mollit. Ex minim deserunt magna voluptate irure sit proident aliqua incididunt amet. Velit dolore velit adipisicing eiusmod do labore consectetur aliqua magna excepteur ullamco. Ad culpa eiusmod officia esse ullamco reprehenderit qui non sint. Nulla aliquip est sit deserunt exercitation. Magna nulla quis mollit anim veniam anim amet ea occaecat in in Lorem nostrud. Officia excepteur adipisicing velit enim culpa amet ex Lorem. Nisi aliqua magna ex consectetur est aute exercitation nulla.",
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
      ),

    );
  }
}