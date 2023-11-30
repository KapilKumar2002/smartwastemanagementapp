// Data Post Screen Code Comments padh lena

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:practice/screens/model.dart';

class MockApiService {
  Future<void> postData(UserModel userModel) async {
    final response = await http.post(
      Uri.parse('https://64d37db567b2662bf3dc5230.mockapi.io/users/users'), //
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userModel
          .toJson()), // userModel jo hai model naam ki file me ek class hai uske andar ek function hai to json data ko json {} me map or convert karne ke liye
    );

    if (response.statusCode == 201) {
      print("Data posted successfully!");
    } else {
      throw Exception('Failed to post data');
    }
  }
}

class PrintDemo extends StatefulWidget {
  const PrintDemo({super.key});

  @override
  State<PrintDemo> createState() => _PrintDemoState();
}

class _PrintDemoState extends State<PrintDemo> {
  UserModel? userModel;
  List<String> datalist = [];
  GlobalKey<FormState> _demokey = GlobalKey<FormState>();
  TextEditingController _usernamecont = TextEditingController();
  TextEditingController _useremailcont = TextEditingController();
  TextEditingController _userphonecont = TextEditingController();

  final apiService =
      MockApiService(); // object banaya hai MockApiService naam ki upar wali class ka jisse ki uske andar ka function call kar sake

  void handleSubmit() async {
    final data = UserModel(
        // use model naam ki class ke constructor ko call kiya jaa raha hai jisme username email phonenumber me jo textfield me data fill kiya gaya hai vo bhej rahe hai
        userName: _usernamecont.text,
        email: _useremailcont.text,
        phonNumber: _userphonecont.text);

    try {
      await apiService.postData(
          data); // MockApiService class ke ander ka function call kar rahe hai
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _demokey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernamecont,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "ENTER YOUR USERNAME",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _useremailcont,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "ENTER YOUR MAIL",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _userphonecont,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: "ENTER YOUR PHONE NUMBER",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    handleSubmit();
                  },
                  child: Text("SUBMIT"))
            ],
          ),
        ),
      ),
    );
  }
}
