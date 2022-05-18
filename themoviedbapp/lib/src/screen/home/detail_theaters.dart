// ignore_for_file: dead_code

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:themoviedbapp/src/model/detail_theaterst_model.dart';
import 'package:http/http.dart' as http;
import 'package:themoviedbapp/src/screen/home/detail_person.dart';

const urlDetail = "https://api.themoviedb.org/3/movie/";
const urlDetail2 =
    "?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=credits";
const urlperson = "https://api.themoviedb.org/3/person/";
const urlperson2 = "?api_key=d79d9f8467a0e6d7b24624c522cb2ab3";

// ignore: must_be_immutable
class DetailTheaterss extends StatefulWidget {
  int? id;

  String? title;
  String? releaseDate;

  DetailTheaterss({
    Key? key,
    required this.id,
    required this.title,
    required this.releaseDate,
  }) : super(key: key);

  @override
  State<DetailTheaterss> createState() =>
      // ignore: no_logic_in_create_state
      _DetailTheaterssState(
        id: id,
        title: title,
        releaseDate: releaseDate,
      );
}

class _DetailTheaterssState extends State<DetailTheaterss> {
  int? id;
  String? title;
  String? releaseDate;
  int? runtime;
  _DetailTheaterssState({this.id, this.title, this.releaseDate, this.runtime});
  late Future<DetailTheaters> detailTheaters;

  @override
  void initState() {
    super.initState();
    detailTheaters = getDetailTheaters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 8, 8, 8),
        appBar: AppBar(
          title: Text(title ?? "khong co du lieu"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _builImageBody(),
              const SizedBox(
                height: 10.0,
              ),
              _builRowDetailBody(),
              const SizedBox(
                height: 20.0,
              ),
              _builIconBody(),
              const SizedBox(
                height: 16.0,
              ),
              const Divider(
                height: 5,
                thickness: 1,
                indent: 10,
                endIndent: 0,
                color: Color.fromARGB(255, 252, 243, 243),
              ),
              const SizedBox(
                height: 16.0,
              ),
              starRatingBody(),
              const SizedBox(
                height: 16.0,
              ),
              const Divider(
                height: 5,
                thickness: 1,
                indent: 10,
                endIndent: 0,
                color: Color.fromARGB(255, 252, 243, 243),
              ),
              _CastPersosn(),
              Container(
                height: 50,
                color: const Color.fromARGB(255, 44, 44, 44),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: const [
                    Text(
                      "Custom List",
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 16),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "None",
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 1.0,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 16,
                      color: Color.fromARGB(255, 248, 248, 248),
                    ),
                    SizedBox(
                      width: 1.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              _builReleaseDateBody(),
              const SizedBox(
                height: 1.0,
              ),
              _builRuntimeBody(),
              const SizedBox(
                height: 1.0,
              ),
              _builRatingBody(),
              const SizedBox(
                height: 1.0,
              ),
              _builGenreBody(),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text(
                  "Director",
                  style: TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248), fontSize: 16),
                ),
              ),
              _builDirectorBody(),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text(
                  "Cast",
                  style: TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248), fontSize: 16),
                ),
              ),
              const Divider(
                height: 2,
                thickness: 1,
                indent: 1,
                endIndent: 0,
                color: Color.fromARGB(255, 252, 243, 243),
              ),
              _CastPerson(),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 60,
                endIndent: 0,
                color: Color.fromARGB(255, 133, 133, 133),
              ),

              // _buildCastssComing(),
              // _buildCastsss(),
            ],
          ),
        ));
  }

  Widget _builImageBody() {
    return FutureBuilder<DetailTheaters>(
      future: detailTheaters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w400${snapshot.data?.posterPath}",
                    ),
                  ],
                ),
              )
            ],
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

  Widget _builRowDetailBody() {
    return FutureBuilder<DetailTheaters>(
      future: detailTheaters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${snapshot.data?.releaseDate} . ${snapshot.data?.runtime} min",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Text("${snapshot.data?.title}",
                    style:
                        const TextStyle(color: Colors.white, fontSize: 40.0)),
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
      },
    );
  }

  Widget _builImagesViewBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FutureBuilder<DetailTheaters>(
        future: detailTheaters,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Center(
                  child: Row(
                    children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/w300${snapshot.data?.posterPath}",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${snapshot.data?.overview}",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
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
      ),
    );
  }

  Widget _builIconBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: const Color.fromARGB(255, 65, 64, 64),
      alignment: Alignment.centerLeft,
      child: Row(
        children: const [
          Icon(
            Icons.video_library,
            size: 60,
            color: Colors.white,
          ),
          Expanded(child: SizedBox()),
          Icon(
            Icons.add,
            size: 60,
            color: Colors.white,
          ),
          SizedBox(
            width: 1.0,
          ),
          Expanded(child: SizedBox()),
          Icon(
            Icons.move_to_inbox,
            size: 60,
            color: Colors.white,
          ),
          SizedBox(
            width: 1.0,
          ),
        ],
      ),
    );
  }

  Widget starRatingBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('My Rating',
              style: TextStyle(color: Colors.white, fontSize: 15.0)),
          const Text('Rate This Movie',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          Row(
            children: const <Widget>[
              Icon(
                Icons.star,
                color: Color.fromARGB(255, 230, 176, 28),
              ),
              Icon(Icons.star, color: Color.fromARGB(255, 230, 176, 28)),
              Icon(Icons.star, color: Color.fromARGB(255, 230, 176, 28)),
              Icon(Icons.star, color: Color.fromARGB(255, 230, 176, 28)),
              Icon(Icons.star, color: Color.fromARGB(255, 230, 176, 28)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _builReleaseDateBody() {
    return FutureBuilder<DetailTheaters>(
      future: detailTheaters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            color: const Color.fromARGB(255, 44, 44, 44),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Text(
                  "Release Date",
                  style: TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248), fontSize: 16),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "${snapshot.data?.releaseDate}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 1.0,
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 16,
                  color: Color.fromARGB(255, 248, 248, 248),
                ),
                const SizedBox(
                  width: 1.0,
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
      },
    );
  }

  Widget _builRuntimeBody() {
    return FutureBuilder<DetailTheaters>(
      future: detailTheaters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            color: const Color.fromARGB(255, 44, 44, 44),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Text(
                  "Runtime",
                  style: TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248), fontSize: 16),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "${snapshot.data?.runtime} min ",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 1.0,
                ),
                // const Icon(Icons.keyboard_arrow_right,size: 16,color: Color.fromARGB(255, 248, 248, 248),),
                // const SizedBox(
                //   width: 1.0,
                // ),
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
      },
    );
  }

  Widget _builRatingBody() {
    return FutureBuilder<DetailTheaters>(
      future: detailTheaters,
      builder: (context, snapshot) {
        
        if (snapshot.hasData) {
          return
        Container(
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            color: const Color.fromARGB(255, 44, 44, 44),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Text(
                  "Rating",
                  style: TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248), fontSize: 16),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "${snapshot.data?.voteAverage}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 1.0,
                ),
                // const Icon(Icons.keyboard_arrow_right,size: 16,color: Color.fromARGB(255, 248, 248, 248),),
                // const SizedBox(
                //   width: 1.0,
                // ),
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
      },
    );
  }

  Widget _builGenreBody() {
    return FutureBuilder<DetailTheaters>(
      future: detailTheaters,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          int index = snapshot.data?.credits?.cast?.length ?? 0;
          for (var i = 0; i < index; i++) {
            if (snapshot.data?.credits?.cast?[i].profilePath != null) {
              return Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 10),
                  color: const Color.fromARGB(255, 44, 44, 44),
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(children: [
                    const Text(
                      "Genre",
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 16),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "${snapshot.data?.genres?[i].name}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 1.0,
                    ),
                  ]));
              // Image.network(
              // "https://image.tmdb.org/t/p/w400${snapshot.data?.credits?.cast?[i].profilePath}");
            }
          }
        }
        return const Center(
          child: Text(
            "loi",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        );
        
      },
    );
  }

  Widget _builPersonBody() {
    return FutureBuilder<DetailTheaters>(
      future: detailTheaters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            color: const Color.fromARGB(255, 44, 44, 44),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Text(
                  "Genre",
                  style: TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248), fontSize: 16),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "${snapshot.data?.status}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 1.0,
                ),
                // const Icon(Icons.keyboard_arrow_right,size: 16,color: Color.fromARGB(255, 248, 248, 248),),
                // const SizedBox(
                //   width: 1.0,
                // ),
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
      },
    );
  }

  Widget _builDirectorBody() {
    return FutureBuilder<DetailTheaters>(
        future: detailTheaters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            int index = snapshot.data?.credits?.crew?.length ?? 0;
            for (var i = 0; i < index; i++) {
              if (snapshot.data?.credits?.crew?[i].job == 'Director') {
                return Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  color: const Color.fromARGB(255, 44, 44, 44),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      snapshot.data?.credits?.crew?[i].profilePath != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://image.tmdb.org/t/p/w400${snapshot.data?.credits?.crew?[i].profilePath}"),
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
                        "${snapshot.data?.credits?.crew?[i].name}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              }
            }
          }
          return const Center(
            child: Text(
              "loi",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          );
        });
  }

  Widget _buildCastssComing() {
    return FutureBuilder<DetailTheaters>(
        future: detailTheaters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            int index = snapshot.data?.credits?.cast?.length ?? 0;
            for (var i = 0; i < index; i++) {
              if (snapshot.data?.credits?.cast?[i].profilePath != null) {
                return Image.network(
                    "https://image.tmdb.org/t/p/w400${snapshot.data?.credits?.cast?[i].profilePath}");
              }
            }
          }
          return const Center(
            child: Text(
              "loi",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          );
        });
  }

  Widget _buildCastsss() {
    return FutureBuilder<DetailTheaters>(
        future: detailTheaters,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            int index = snapshot.data?.productionCompanies?.length ?? 0;
            for (var i = 0; i < index; i++) {
              if (snapshot.data?.productionCompanies?[i].logoPath != null) {
                return Image.network(
                    "https://image.tmdb.org/t/p/w400${snapshot.data?.productionCompanies?[i].logoPath}");
              }
            }
          }
          return const Center(
            child: Text(
              "loi",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          );
        });
  }

  Widget _CastPerson() {
    return FutureBuilder<DetailTheaters>(
      future: detailTheaters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            color: const Color.fromARGB(255, 44, 44, 44),
            child: Column(
              children: [
                ...List.generate(4, (index) {
                  if (snapshot.data?.credits?.cast?[index].profilePath !=
                      null) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonDetail(
                              id: snapshot.data?.credits?.cast?[index].id,
                              title: snapshot.data?.credits?.cast?[index].name,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        // margin: EdgeInsets.only(top: 5.0),
                        padding: const EdgeInsets.only(left: 15),
                        height: 70,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: Colors.white38)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://image.tmdb.org/t/p/w400${snapshot.data?.credits?.cast?[index].profilePath}"),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                                "${snapshot.data?.credits?.cast?[index].name}"),
                          ],
                        ),
                      ),
                    );
                  }
                  return Container(
                    // margin: EdgeInsets.only(top: 5.0),
                    padding: const EdgeInsets.only(left: 15),
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.white38)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://image.tmdb.org/t/p/w400${snapshot.data?.credits?.cast?[index].profilePath}"),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text("${snapshot.data?.credits?.cast?[index].name}"),
                      ],
                    ),
                  );
                })
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
      },
    );
  }

  Widget _CastPersosn() {
    return FutureBuilder<DetailTheaters>(
      future: detailTheaters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Colors.white24,
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  ...List.generate(2, (index) {
                    if (snapshot.data?.productionCompanies?[index].logoPath != null) {
                      return Row(
                        children: [
                          Image.network(
                              "https://image.tmdb.org/t/p/w300${snapshot.data?.productionCompanies?[index].logoPath}"),
                          const SizedBox(
                            width: 10.0,
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: SizedBox(),
                        // Icon(Icons.abc),
                      );
                    }
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

  Future<DetailTheaters> getDetailTheaters() async {
    final response = await http.get(Uri.parse('$urlDetail$id$urlDetail2'));
    if (response.statusCode == 200) {
      return DetailTheaters.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }
    throw Exception("false");
  }
}
