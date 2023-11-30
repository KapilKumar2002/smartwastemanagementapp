import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/usermodel.dart';

class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({super.key});

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  Stream<List<UserMOdel>> fetchData() async* {
    while (true) {
      final response = await http.get(
          Uri.parse('https://64d37db567b2662bf3dc5230.mockapi.io/users/users'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        yield data.cast<UserMOdel>();
      }

      await Future.delayed(
          Duration(seconds: 10)); // Fetch data every 10 seconds
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator while waiting for data.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Data is available; display it in your UI.
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return ListTile(
                title: Text(item.userName.toString()),
                // Access other data fields using keys.
              );
            },
          );
        }
      },
    ));
  }
}
