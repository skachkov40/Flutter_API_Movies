class Movie {
  String title;
  var year;
  var poster;
  var description;

  Movie({this.title, this.year, this.poster, this.description});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'],
        year: json['year'],
        poster: json['poster'],
        description: json['description']);
  }
}
