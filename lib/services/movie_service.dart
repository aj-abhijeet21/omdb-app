import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:omdb_app/models/movie.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchData(String url) async {
  var _url = Uri.parse(url);
  var response = await http.get(_url);

  // print(response.body);
  if (response.statusCode == 200) {
    Map jsonData = json.decode(response.body);
    List<Movie> movieList = [];

    if (jsonData['Response'] == 'True') {
      var data = jsonData['Search'] as List;
      for (var element in data) {
        movieList.add(Movie.fromJson(element));
      }
      // print(movieList.length);
      return movieList;
    } else {
      throw Exception(jsonData['Error']);
    }
  } else {
    throw Exception('Unable to fetch movies');
  }
}

class MovieDetailProvider extends ChangeNotifier {
  String movieName = '';

  void setMovieName(String name) {
    movieName = name;
    notifyListeners();
  }
}
