import 'package:flutter/material.dart';
import 'package:omdb_app/models/movie.dart';
import 'package:omdb_app/services/constants.dart';
import 'package:omdb_app/services/movie_service.dart';
import 'package:omdb_app/widgets/glowing_button.dart';
import 'package:omdb_app/widgets/home_header.dart';
import 'package:omdb_app/widgets/movie_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String contentType = latestMovies;
  bool movieButtonPressed = false;
  bool seriesButtonPressed = false;
  bool musicButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            bottom: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const BuildHeader(),
                const SizedBox(
                  height: 30,
                ),
                buildButtonRow(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'NEW',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<Movie>>(
                  future: fetchData(contentType),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: pink,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        );
                      } else {
                        if (contentType == latestMovies) {
                          contentType = movies;
                        } else if (contentType == latestSeries) {
                          contentType = series;
                        }
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: MovieList(
                                movies: snapshot.data!,
                                contentType: 'NEW',
                              ),
                            ),
                          ],
                        );
                      }
                    } else {
                      return const Center(
                        child: Text(
                          'Unable to fetch movies',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'POPULAR',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<Movie>>(
                  future: fetchData(contentType),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: pink,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: MovieList(
                                movies: snapshot.data!,
                                contentType: 'POPULAR',
                              ),
                            ),
                          ],
                        );
                      }
                    } else {
                      return const Center(
                        child: Text(
                          'Unable to fetch movies',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'TRENDING',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<Movie>>(
                  future: fetchData(contentType),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: pink,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        );
                      } else {
                        if (contentType == latestMovies) {
                          contentType = movies;
                        } else if (contentType == latestSeries) {
                          contentType = series;
                        }
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: MovieList(
                                movies: snapshot.data!,
                                contentType: 'TRENDING',
                              ),
                            ),
                          ],
                        );
                      }
                    } else {
                      return const Center(
                        child: Text(
                          'Unable to fetch movies',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        glowButton(
          title: 'Movies',
          isPressed: movieButtonPressed,
          onClick: () {
            setState(() {
              movieButtonPressed = !movieButtonPressed;
              seriesButtonPressed = false;
              musicButtonPressed = false;
              contentType = latestMovies;
            });
          },
        ),
        glowButton(
          title: 'Shows',
          isPressed: seriesButtonPressed,
          onClick: () {
            setState(() {
              seriesButtonPressed = !seriesButtonPressed;
              movieButtonPressed = false;
              musicButtonPressed = false;
              contentType = latestSeries;
            });
          },
        ),
        glowButton(
          title: 'Music',
          isPressed: musicButtonPressed,
          onClick: () {
            setState(() {
              musicButtonPressed = !musicButtonPressed;
              seriesButtonPressed = false;
              movieButtonPressed = false;
              contentType = latestMovies;
            });
          },
        ),
      ],
    );
  }
}
