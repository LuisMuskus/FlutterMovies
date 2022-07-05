import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';


class MoviesProvider extends ChangeNotifier {

  final String _apiKey='dd7854224002eb09c8c7ad94e54f3777';
  final String _baseUrl='api.themoviedb.org';
  final String _language='es-ES';
  final String _segmentNowPlaying= '3/movie/now_playing';
  final String _segmentPopularMovies= '3/movie/popular';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast ={};

  int _popularPage = 0;

  MoviesProvider(){

    print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopularMovies();

  }

    Future<String> _getJsonData(String endpoint, [int page= 1]) async{

     final url =
      Uri.https(_baseUrl, endpoint, {
        'api_key':_apiKey,
        'language': _language,
        'page': '$page'
      });
     final  response = await http.get(url);
     //print(response.body);
     return response.body ;

  }
  
  getOnDisplayMovies() async {

    final jsonData= await this._getJsonData(_segmentNowPlaying);
     // Await the http get response, then decode the json-formatted response.
     //print(response.body);
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData) ;
     //print(nowPlayingResponse.results[0].title);
      onDisplayMovies = nowPlayingResponse.results;
      notifyListeners(); // Notifica a los widgets cuando hay cambios

  }

  getPopularMovies() async{

    _popularPage++;

    final jsonData= await this._getJsonData(_segmentPopularMovies, _popularPage);
     // Await the http get response, then decode the json-formatted response.
     //print(response.body);
    final popularResponse = PopularResponse.fromJson(jsonData) ;
     //print(nowPlayingResponse.results[0].title);
      popularMovies = [...popularMovies, ...popularResponse.results];
      //print(popularMovies[0]);
      notifyListeners(); // Notifica a los widgets cuando hay cambios

  }

  Future<List<Cast>> getMoviesCast( int movieId ) async{

    //TODO: Revisar el mapa, se coloca un if para validar q exista el movieId y no vuelva a hacer una peticion, debe quedar en memoria

    if ( moviesCast.containsKey(movieId)) return moviesCast[movieId]!; 
    // se escirbe ! para exponerle a dart q simepre va venir un id

    

    print("pidiendo info al servidor - Cast");

    final jsonData= await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;

  }


  Future<List<Movie>> searchMovies(String query) async{

    final url =
      Uri.https(_baseUrl, '3/search/movie', {
        'api_key':_apiKey,
        'language': _language,
        'query': query
      });
    final  response = await http.get(url);
     //print(response.body);
    final searchResponse = SearchResponse.fromJson(response.body) ;

    return searchResponse.results ;


  }


}