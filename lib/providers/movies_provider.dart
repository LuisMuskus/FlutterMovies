import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';


class MoviesProvider extends ChangeNotifier {

  final String _apiKey='dd7854224002eb09c8c7ad94e54f3777';
  final String _baseUrl='api.themoviedb.org';
  final String _language='es-ES';
  final String _segmentNowPlaying= '3/movie/now_playing';

  List<Movie> onDisplayMovies = [];

  MoviesProvider(){

    print('MoviesProvider inicializado');
    getOnDisplayMovies();

  }
  
  getOnDisplayMovies() async {
     var url =
      Uri.https(_baseUrl, _segmentNowPlaying, {
        'api_key':_apiKey,
        'language': _language,
        'page': '1'
      });

  // Await the http get response, then decode the json-formatted response.
     final  response = await http.get(url);
     //print(response.body);
     final nowPlayingResponse = NowPlayingResponse.fromJson(response.body) ;
     //print(nowPlayingResponse.results[0].title);
      onDisplayMovies = nowPlayingResponse.results;
      notifyListeners(); // Notifica a los widgets cuando hay cambios


  }
}