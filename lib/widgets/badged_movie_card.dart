import 'package:flutter/material.dart';
import 'package:omdb_app/models/movie.dart';
import 'package:omdb_app/screens/movie_detail_page.dart';
import 'package:omdb_app/services/constants.dart';
import 'package:omdb_app/services/movie_service.dart';
import 'package:provider/provider.dart';

class MovieCardBadged extends StatelessWidget {
  MovieCardBadged({
    required this.movie,
    required this.badgeName,
  });
  final Movie movie;
  final String badgeName;
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
                image: movie.poster != 'N/A'
                    ? NetworkImage(movie.poster)
                    : const Image(
                        image: AssetImage('assets/images/broken.png'),
                      ).image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: badgeName == 'NEW' ? 42 : 30,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: badgeName == 'NEW' ? green : pink,
            ),
            child: Text(
              badgeName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
