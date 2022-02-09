import 'package:flutter/material.dart';
import 'package:omdb_app/models/movie.dart';
import 'package:omdb_app/widgets/badged_movie_card.dart';
import 'package:omdb_app/widgets/movie_card.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final String contentType;

  MovieList({
    required this.movies,
    required this.contentType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (contentType == 'NEW') {
            return MovieCardBadged(movie: movies[index], badgeName: 'NEW');
          } else if (contentType == 'TRENDING') {
            return MovieCardBadged(movie: movies[index], badgeName: 'TRENDING');
          } else {
            return MovieCard(movie: movies[index]);
          }
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
