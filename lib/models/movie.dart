class Movie {
  String title;
  String year;
  String imdbId;
  String type;
  String poster;

  Movie({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.type,
    required this.poster,
  });

  factory Movie.fromJson(dynamic json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      imdbId: json['imdbID'],
      type: json['Type'],
      poster: json['Poster'],
    );
  }
}
