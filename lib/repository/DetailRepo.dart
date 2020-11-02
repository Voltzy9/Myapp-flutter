import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/DetailFilm.dart';

Future<DetailFilm> fetchDetail(int movie_id) async {
  final response = await http.get('https://api.themoviedb.org/3/movie/$movie_id?api_key=62feaff3d2cf094a340f530fbf25bde9&language=en-US');
  final responseCast = await http.get('https://api.themoviedb.org/3/movie/$movie_id/credits?api_key=62feaff3d2cf094a340f530fbf25bde9&language=en-US');
  if(response.statusCode == 200) {
    return DetailFilm.fromJson(jsonDecode(response.body), jsonDecode(responseCast.body));
  } else {
    throw Exception('Failed to load movie');
  }
}

Future<DetailFilm> fetchDetailTv(int tv_id) async {
  final response = await http.get('https://api.themoviedb.org/3/tv/$tv_id?api_key=62feaff3d2cf094a340f530fbf25bde9&language=en-US');
  final responseCast = await http.get('https://api.themoviedb.org/3/movie/$tv_id/credits?api_key=62feaff3d2cf094a340f530fbf25bde9&language=en-US');
  if(response.statusCode == 200) {
    return DetailFilm.fromJson(jsonDecode(response.body), jsonDecode(responseCast.body));
  } else {
    throw Exception('Failed to load movie');
  }
}

// Future<DetailFilm> fetchMoviePerson(DetailFilm detail) async {
//   final response = await http.get('https://api.themoviedb.org/3/' + detail.type +'/'+ detail.id.toString() +  '/credits?api_key=62feaff3d2cf094a340f530fbf25bde9&language=en-US');
//   if(response.statusCode == 200) {
//     return DetailFilm.fromJson(jsonDecode(response.body), jsonDecode(responseCasr));
//   } else {
//     throw Exception('Failed to load movie');
//   }
// }