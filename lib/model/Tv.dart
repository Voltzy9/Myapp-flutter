class Tv {
  final String name;
  final String poster_path;
  final int id;

  Tv({this.id, this.name, this.poster_path});

  factory  Tv.fromJson(Map<String, dynamic> json){
    return  Tv(
      name: json['name'],
      id: json['id'],
      poster_path: json['poster_path'],
    );
  }
}