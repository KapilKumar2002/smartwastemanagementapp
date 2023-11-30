import 'package:flutter/material.dart';
import 'package:practice/builders/futurebuilder.dart';
import 'package:practice/builders/stream.dart';
import 'package:practice/dropdown/dropDown.dart';
import 'package:practice/screens/bottomnav.dart';
import 'package:practice/screens/buttontabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomDropDownWidget(),
      // home: DefaultTabController(

      //   length: 5,
      //   child: Scaffold(
      //     appBar: AppBar(
      //       bottom: TabBar(

      //         onTap: (value) {},
      //         tabs: [
      //           Tab(icon: Icon(Icons.music_note)),
      //           Tab(icon: Icon(Icons.music_video)),
      //           Tab(icon: Icon(Icons.camera_alt)),
      //           Tab(icon: Icon(Icons.grade)),
      //           Tab(icon: Icon(Icons.email)),
      //         ],
      //       ), // TabBar
      //       title: const Text('GeeksForGeeks'),
      //       backgroundColor: Colors.green,
      //     ), // AppBar
      //     body: TabBarView(
      //       children: [
      //         ListView.builder(
      //           itemCount: 10,
      //           shrinkWrap: true,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 60,
      //                 color: Colors.black,
      //               ),
      //             );
      //           },
      //         ),
      //         ListView.builder(
      //           itemCount: 15,
      //           shrinkWrap: true,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 60,
      //                 color: Colors.black,
      //               ),
      //             );
      //           },
      //         ),
      //         ListView.builder(
      //           itemCount: 2,
      //           shrinkWrap: true,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 60,
      //                 color: Colors.black,
      //               ),
      //             );
      //           },
      //         ),
      //         ListView.builder(
      //           itemCount: 25,
      //           shrinkWrap: true,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 60,
      //                 color: Colors.black,
      //               ),
      //             );
      //           },
      //         ),
      //         ListView.builder(
      //           itemCount: 10,
      //           shrinkWrap: true,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 60,
      //                 color: Colors.black,
      //               ),
      //             );
      //           },
      //         ),
      //       ],
      //     ), // TabBarView
      //   ), // Scaffold
      // ),
    );
  }
}
