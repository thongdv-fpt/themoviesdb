import 'dart:convert';
import 'package:themoviedbapp/src/model/detail_theaterst_model.dart';
import 'package:http/http.dart' as http;

const urlDetail = "https://api.themoviedb.org/3/movie/";
const urlDetail2 = "?api_key=d79d9f8467a0e6d7b24624c522cb2ab3";

Future<DetailTheaters> getDetailTheaters(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return DetailTheaters.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }
    throw Exception("false");
  }