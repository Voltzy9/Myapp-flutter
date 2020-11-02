class DetailFilm {
  final String title;
  final String poster_path;
  final int id;
  final String vote_average;
  final String overview;
  final String release_date;
  final List genres;
  final String name;
  final String first_air_date;
  final List cast;

  DetailFilm({this.id, this.title, this.poster_path, this.vote_average, this.overview, this.release_date, this.genres, this.name, this.first_air_date, this.cast});

  factory  DetailFilm.fromJson(Map<String, dynamic> json, Map<String, dynamic> json_tmp){
    return  DetailFilm(
      title: json['title'] ?? json['name'],
      id: json['id'],
      poster_path: json['poster_path'],
      vote_average: json['vote_average'].toString(),
      overview: json['overview'],
      release_date: json['release_date'] ?? json['first_air_date'],
      genres: json["genres"] ?? json[''],
      cast: json_tmp['cast'] ?? json[''],
    );
  }
}