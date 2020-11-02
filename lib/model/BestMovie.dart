class BestMovie {
  final String title;
  final String poster_path;
  final int id;

  BestMovie({this.id, this.title, this.poster_path});

  factory  BestMovie.fromJson(Map<String, dynamic> json){
    return  BestMovie(
      title: json['title'],
      id: json['id'],
      poster_path: json['poster_path'],
    );
  }
}