// data fetch karne ke liye

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice/screens/model.dart';

class MockApiService {
  Future<List<UserModel>> fetchUserModels() async {
    final response = await http.get(
        Uri.parse('https://64d37db567b2662bf3dc5230.mockapi.io/users/users'));

    if (response.statusCode == 200) {
      Iterable data = json.decode(response.body);
      List<UserModel> UserModels =
          data.map((model) => UserModel.fromJson(model)).toList();
      return UserModels;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  final apiService = MockApiService();
  List<UserModel> Users = [];

  void fetchData() async {
    try {
      List<UserModel> fetchedUserModels = await apiService.fetchUserModels();
      setState(() {
        Users = fetchedUserModels;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: Users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(Users[index].userName.toString() +
                        ", email=>  " +
                        Users[index].email.toString()),
                    subtitle: Text(Users[index].phonNumber.toString()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
