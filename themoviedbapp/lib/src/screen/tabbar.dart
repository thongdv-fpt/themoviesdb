// import 'package:flutter/material.dart';

// class TabBarHome extends StatelessWidget with SingleTickerProviderStateMixin{
//   const TabBarHome({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.symmetric(vertical: 25.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               height: 40,
//               width: double.infinity,

//               margin: const EdgeInsets.all(8.0),
//               // padding: const EdgeInsets.symmetric(vertical: 25.0),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF49464b),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TabBar(
//                 labelColor: Colors.red,
//                 indicator: BoxDecoration(
//                   color: const Color(0xFFff3a30),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 tabs: const <Widget>[
//                   Tab(
//                     child: Text(
//                       'Top list',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       'Top list',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       'Top list',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//                 controller: tabController,
//                 indicatorSize: TabBarIndicatorSize.tab,
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 height: 300,
//                 color: const Color(0xFF49464b),
//                 child: TabBarView(
//                   children: [
//                     Container(child: Center(child: Text('people'))),
//                     Text('Person'),
//                     Text('Person')
//                   ],
//                   controller: tabController,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//   }
// }