class MoviePopular {
  final String title;
  final int id;
  final String poster_path;

  MoviePopular({this.id, this.title, this.poster_path});

  factory  MoviePopular.fromJson(Map<String, dynamic> json){
    return  MoviePopular(
      title: json['title'],
      id: json['id'],
      poster_path: json['poster_path'],
    );
  }
}