class Movie {
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;

  Movie({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
  });

  //Factory constructor para criar um objeto Movie a partir de um JSON.
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
