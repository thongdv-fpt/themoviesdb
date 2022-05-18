import 'dart:convert';

import '../model/detail_theaterst_model.dart';
import '../screen/home/homepage.dart';
import 'package:http/http.dart' as http;

import 'homepage_network.dart';
const urlDetail = "https://api.themoviedb.org/3/movie/";
const urlDetail2 = "?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=credits";


Future<Cast> getPerson(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Cast.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }
    throw Exception("false");
  }