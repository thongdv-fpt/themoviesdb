import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:themoviedbapp/src/netword/up_coming_network.dart';
import 'package:themoviedbapp/src/screen/home/detail_theaters.dart';

import '../../model/now_playing_model.dart';

import 'package:http/http.dart' as http;

import '../../model/up_coming_model.dart';
import '../../netword/homepage_network.dart';

const url_img = "https://image.tmdb.org/t/p/w300/";

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late Future<NowPlaying> listNowplaying;
  late Future<UpComing> listUpComing;
  // get results => null;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    listNowplaying = getMovieData();
    listUpComing= getUpComing();
    // detailTheaters= getImages();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 44, 44, 44),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              
              children: <Widget>[
                _appbarHome(),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    child: TabBarView(
                      children: [
                        _buildInTheaters(),
                        _buildInTheaters(),
                        _buildFutureUpComing(),
                      ],
                      controller: tabController,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomBarHome(),
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
          Text('Top list', style: TextStyle(color: Colors.white)),
          Text('In theaters', style: TextStyle(color: Colors.white)),
          Text('Up Coming', style: TextStyle(color: Colors.white)),
        ],
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
    );
  }

  Widget _buildFutureUpComing() {
    return FutureBuilder<UpComing>(
      future: listUpComing,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
              ),
              
              itemCount: snapshot.data?.results?.length,
              itemBuilder: (context, index) {
                return Image.network(
                    "$url_img${snapshot.data?.results?[index].posterPath}");
              });
        } else {
          return const Center(
              child: Text(
            "loi",
            style: TextStyle(fontSize: 40,color: Color.fromARGB(179, 44, 44, 44)),
          ));
        }
      },
    );
  }

  Widget _buildInTheaters() {
    return FutureBuilder<NowPlaying>(
      future: listNowplaying,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
              ),
              itemCount: snapshot.data?.results?.length,
              itemBuilder: (
                context,
                index,
              ) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTheaterss(
                          id: snapshot.data?.results?[index].id,
                          title: snapshot.data?.results?[index].title,
                          releaseDate: snapshot.data?.results?[index].releaseDate, 
                                              
                          
                        ),
                      ),
                    );
                  },
                  child: Image.network(
                      "https://image.tmdb.org/t/p/w300${snapshot.data?.results?[index].posterPath}"),
                );
              });
        } else {
          return const Center(
              child: Text(
            " " ,
            style: TextStyle(fontSize: 40),
          ));
        }
      },
    );
  }

  Widget bottomBarHome() {
    return BottomNavigationBar(
        backgroundColor:const Color.fromARGB(179, 65, 65, 65),
        showUnselectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: const Color.fromARGB(115, 209, 209, 209),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Discover"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "My Lists"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "News"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ]);
  }
}
