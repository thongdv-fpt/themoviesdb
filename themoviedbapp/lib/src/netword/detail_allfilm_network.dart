// Future<AllFilm>getAllFilm()async {
//     final response = await http.get(Uri.parse('$urlperson$id$urlperson3'));
//     if (response.statusCode == 200) {
//       return AllFilm.fromJson(
//           jsonDecode(response.body) as Map<String, dynamic>);
//     }
//     throw Exception("false");
//   }
// import 'dart:convert';

// import '../model/detail_allfilm_model.dart';
// import '../model/detail_theaterst_model.dart';
// import '../screen/home/homepage.dart';
// import 'package:http/http.dart' as http;

// import 'homepage_network.dart';
// const urlfilmall1 = "https://api.themoviedb.org/3/person/";
// const urlfilmall2 = "movie_credits?api_key=d79d9f8467a0e6d7b24624c522cb2ab3";


// Future<AllFilm>getAllFilm()async {
//     final response = await http.get(Uri.parse('$urlfilmall1$id$urlfilmall2'));
//     if (response.statusCode == 200) {
//       return AllFilm.fromJson(
//           jsonDecode(response.body) as Map<String, dynamic>);
//     }
//     throw Exception("false");
//   }