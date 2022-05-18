import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home,),
      label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.home,),
      label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.upload,),
      label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.person,),
      label: "Home"),

    ],

    );
  }
}