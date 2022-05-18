import 'dart:convert';
import 'package:themoviedbapp/src/model/up_coming_model.dart';

import 'package:http/http.dart' as http;
const url =
    "https://api.themoviedb.org/3/movie/upcoming?api_key=d79d9f8467a0e6d7b24624c522cb2ab3";

Future<UpComing> getUpComing() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return UpComing.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }
    throw Exception("false");
  }