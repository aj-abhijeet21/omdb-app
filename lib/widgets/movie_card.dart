import 'package:flutter/material.dart';
import 'package:omdb_app/models/movie.dart';
import 'package:omdb_app/screens/movie_detail_page.dart';
import 'package:omdb_app/services/movie_service.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  Movie movie;
  MovieCard({required this.movie});
  @override
  Widget build(BuildContext context) {
    MovieDetailProvider provider =
        Provider.of<MovieDetailProvider>(context, listen: false);
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            provider.setMovieName(movie.title);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MovieDetailPage();
                },
              ),
            );
          },
          child: Container(
            height: 180,
            width: 120,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: NetworkImage(movie.poster),
                fit: BoxFit.fill,
              ),
            ),
            // child: Text(movie.title),
          ),
        ),
      ],
    );
  }
}
