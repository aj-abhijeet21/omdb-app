import 'package:flutter/material.dart';
import 'package:omdb_app/services/constants.dart';
import 'package:omdb_app/services/movie_service.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetailProvider provider =
        Provider.of<MovieDetailProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              provider.movieName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Text(
              'back',
              style: TextStyle(color: pink, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
