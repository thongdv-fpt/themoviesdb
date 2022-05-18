import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/detail_allfilm_model.dart';
import '../../model/detail_person.dart';
import 'detail_theaters.dart';

const urlperson = "https://api.themoviedb.org/3/person/";
const urlperson2 = "?api_key=d79d9f8467a0e6d7b24624c522cb2ab3";

const urlfilmall1 = "https://api.themoviedb.org/3/person/";
const urlfilmall2 = "/movie_credits?api_key=d79d9f8467a0e6d7b24624c522cb2ab3";

class PersonDetail extends StatefulWidget {
  int? id;
  String? title;
  PersonDetail({Key? key, required this.id, required this.title})
      : super(key: key);
  @override
  State<PersonDetail> createState() => _PersonDetailState(
        id: id,
        title: title,
      );
}

class _PersonDetailState extends State<PersonDetail>
    with SingleTickerProviderStateMixin {
  int? id;
  String? title;
  _PersonDetailState({this.id, this.title});
  late Future<Detailperson> detailPerson;
  late TabController tabController;
  late Future<AllFilm> detailAllFilm;

  @override
  void initState() {
    super.initState();
    detailPerson = getPersonDetail();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    detailAllFilm = getallFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 8, 8),
      appBar: AppBar(
        title: Text(title ?? "khong co du lieu"),
      ),
      body: Column(children: [
      
        _builImageBody(),
        _appbarHome(),
        Expanded(
          child: Container(
            color: Color.fromARGB(255, 253, 250, 250),
            child: TabBarView(
              children: [
                _Movies(),
                _CastPerson(),

              ],
              controller: tabController,
            ),
          ),
        ),
      ]),
    );
  }
  Widget _appbarHome() {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.all(8.0),
      // padding: const EdgeInsets.symmetric(vertical: 25.0),
      decoration: BoxDecoration(
        color: const Color(0xFF49464b),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        labelColor: Colors.red,
        indicator: BoxDecoration(
          color: const Color(0xFFff3a30),
          borderRadius: BorderRadius.circular(10),
        ),
        tabs: const [
          Text('Biography', style: TextStyle(color: Colors.white)),
          Text('Movies', style: TextStyle(color: Colors.white)),
        ],
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
    );
  }

  Widget _Movies() {
    return FutureBuilder<Detailperson>(
      future: detailPerson,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "${snapshot.data?.biography}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 14, 13, 13),
                            fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: Text(
              " ",
              style: TextStyle(fontSize: 40),
            ),
          );
        }
      },
    );
  }

  Widget _CastPerson() {
    return FutureBuilder<AllFilm>(
      future: detailAllFilm,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Container(
              color: const Color.fromARGB(255, 44, 44, 44),
              child: Column(
                children: [
                  ...List.generate(10, (index) {
                    if (snapshot.data?.cast?[index].posterPath != null) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailTheaterss(
                                id: snapshot.data?.cast?[index].id,
                                title: snapshot.data?.cast?[index].title,
                                releaseDate:
                                    snapshot.data?.cast?[index].releaseDate,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          // margin: EdgeInsets.only(top: 5.0),
                          padding: const EdgeInsets.only(left: 15),
                          height: 70,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5, color: Colors.white38)),
                          child: Row(
                            children: [
                              snapshot.data?.cast?[index].posterPath != null
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://image.tmdb.org/t/p/w400${snapshot.data?.cast?[index].posterPath}"),
                                    )
                                  : const CircleAvatar(
                                      child: Text(
                                        "DR",
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "${snapshot.data?.cast?[index].originalTitle}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return InkWell(
                      child: Container(
                        // margin: EdgeInsets.only(top: 5.0),
                        padding: const EdgeInsets.only(left: 15),
                        height: 70,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: Colors.white38)),
                        child: Row(
                          children: [
                            snapshot.data?.cast?[index].posterPath != null
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://image.tmdb.org/t/p/w400${snapshot.data?.cast?[index].posterPath}"),
                                  )
                                : const CircleAvatar(
                                    child: Text(
                                      "DR",
                                      style: TextStyle(fontSize: 40),
                                    ),
                                  ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "${snapshot.data?.cast?[index].title}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text(
              "loi",
              style: TextStyle(fontSize: 40),
            ),
          );
        }
      },
    );
  }

  Widget _builImageBody() {
    return FutureBuilder<Detailperson>(
        future: detailPerson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                      'https://image.tmdb.org/t/p/w400${snapshot.data?.profilePath}',
                      fit: BoxFit.cover),
                  ClipRRect(
                    // Clip it cleanly.
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://image.tmdb.org/t/p/w400${snapshot.data?.profilePath}"),
                              minRadius: 50,
                              maxRadius: 50,
                            ),
                            Column(
                              children: [
                                Text(
                                  "${snapshot.data?.birthday}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Text(
                              "${snapshot.data?.placeOfBirth}",
                              style: TextStyle(color: Colors.white),
                            ),
                            const Text(
                              "22 Movies",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                "loi",
                style: TextStyle(fontSize: 40),
              ),
            );
          }
        });
  }

  Future<Detailperson> getPersonDetail() async {
    final response = await http.get(Uri.parse('$urlperson$id$urlperson2'));
    if (response.statusCode == 200) {
      return Detailperson.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }
    throw Exception("false");
  }

  Future<AllFilm> getallFile() async {
    final response = await http.get(Uri.parse('$urlfilmall1$id$urlfilmall2'));
    if (response.statusCode == 200) {
      return AllFilm.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }
    throw Exception("false");
  }
}
