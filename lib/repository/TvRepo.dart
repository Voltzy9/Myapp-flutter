import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Tv.dart';

Future<List<Tv>> fetchPopularTv() async {
  final response = await http.get('https://api.themoviedb.org/3/tv/popular?api_key=62feaff3d2cf094a340f530fbf25bde9&language=en-US&page=1');
  if(response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    return (responseJson['results'] as List).map((p) => Tv.fromJson(p)).toList();
  } else {
    throw Exception('Failed to load movie');
  }
}

