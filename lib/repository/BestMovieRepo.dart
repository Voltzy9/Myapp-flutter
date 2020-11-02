import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/BestMovie.dart';

Future<List<BestMovie>> fetchBestMovie() async {
  final response = await http.get('https://api.themoviedb.org/3/movie/top_rated?api_key=62feaff3d2cf094a340f530fbf25bde9&language=en-US&page=1');
  if(response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    return (responseJson['results'] as List).map((p) => BestMovie.fromJson(p)).toList();
  } else {
    throw Exception('Failed to load movie');
  }
}

