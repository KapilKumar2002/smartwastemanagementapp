// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:practice/models/usermodel.dart';

// class MyWidget extends StatelessWidget {
//   Future<List<UserMOdel>> fetchPosts() async {
//     final response = await http.get(
//         Uri.parse('https://64d37db567b2662bf3dc5230.mockapi.io/users/users'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((post) => UserMOdel.fromJson(post)).toList();
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }

//   Future<void> deleteItem(int itemId) async {
//     final apiUrl =
//         'https://64d37db567b2662bf3dc5230.mockapi.io/users/users/$itemId'; // Replace with your API endpoint
//     final response = await http.delete(Uri.parse(apiUrl));

//     if (response.statusCode == 204) {
//       // 204 status code indicates a successful deletion
//       print('Item with ID $itemId has been deleted.');
//     } else {
//       // Handle errors or non-successful responses here
//       print('Failed to delete item. Status code: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder<List<UserMOdel>>(
//           stream:
//               Stream.fromFuture(fetchPosts()), // Convert the Future to a Stream
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData) {
//               return Text('No data available');
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       color: Colors.yellow,
//                       padding: EdgeInsets.all(4),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text.rich(
//                                 TextSpan(children: [
//                                   TextSpan(text: "Phone : "),
//                                   TextSpan(
//                                       text: snapshot.data![index].phonNumber)
//                                 ]),
//                               ),
//                               Text.rich(
//                                 TextSpan(children: [
//                                   TextSpan(text: "email : "),
//                                   TextSpan(text: snapshot.data![index].email)
//                                 ]),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               ElevatedButton(
//                                   onPressed: () {}, child: Text("Edit")),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               ElevatedButton(
//                                   onPressed: () {
//                                     deleteItem(int.parse(
//                                         snapshot.data![index].id.toString()));
//                                   },
//                                   child: Text("Delete")),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/models/usermodel.dart';

// class Post {
//   final int id;
//   final String title;
//   final String body;

//   Post({required this.id, required this.title, required this.body});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final StreamController<List<UserMOdel>> _controller =
      StreamController<List<UserMOdel>>();

  @override
  void initState() {
    super.initState();
    fetchData(); // Initialize data loading
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('https://64d37db567b2662bf3dc5230.mockapi.io/users/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<UserMOdel> posts =
          data.map((post) => UserMOdel.fromJson(post)).toList();
      _controller.sink.add(posts); // Add data to the stream
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> deleteItem(int itemId) async {
    final apiUrl =
        'https://64d37db567b2662bf3dc5230.mockapi.io/users/users/$itemId'; // Replace with your API endpoint
    final response = await http.delete(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // 204 status code indicates a successful deletion
      print('Item with ID $itemId has been deleted.');
      fetchData();
    } else {
      // Handle errors or non-successful responses here
      print('Failed to delete item. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<List<UserMOdel>>(
          stream: _controller.stream, // Convert the Future to a Stream
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data available');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.yellow,
                      padding: EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(text: "Phone : "),
                              TextSpan(text: snapshot.data![index].phonNumber)
                            ]),
                          ),
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(text: "email : "),
                              TextSpan(text: snapshot.data![index].email)
                            ]),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Edit")),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    deleteItem(int.parse(
                                        snapshot.data![index].id.toString()));
                                  },
                                  child: Text("Delete")),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
