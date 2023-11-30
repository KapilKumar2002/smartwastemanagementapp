import 'dart:convert';

import 'package:budget_tracker/Users/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchUsers extends StatefulWidget {
  const FetchUsers({super.key});

  @override
  State<FetchUsers> createState() => _FetchUsersState();
}

class _FetchUsersState extends State<FetchUsers> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController userController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  String formType = 'add';
  Future<List<UserModel>> getUsers() async {
    final response = await http.get(
        Uri.parse("https://64d37db567b2662bf3dc5230.mockapi.io/users/users"));

    if (response.statusCode == 200) {
      Iterable data = json.decode(response.body);

      return data.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> postData(UserModel userModel) async {
    final response = await http.post(
      Uri.parse(
          'https://64d37db567b2662bf3dc5230.mockapi.io/users/users'), // Replace with your endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userModel.toJson()),
    );

    if (response.statusCode == 201) {
      print("Data posted successfully!");
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse(
        "https://64d37db567b2662bf3dc5230.mockapi.io/users/users/${id}"));
    if (response.statusCode == 200) {
      print("User deleted successfully");
      getUsers();
    } else {
      // Handle error (e.g., item not found, network issues, etc.)
      print('Failed to delete item: ${response.statusCode}');
    }
  }

  void handleSubmit() async {
    final data = UserModel(
      userName: userController.text,
      phonNumber: phoneController.text,
      email: emailController.text,
    );

    try {
      await postData(data);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> updateData(UserModel userModel) async {
    try {
      final response = await http.put(
        Uri.parse(
            'https://64d37db567b2662bf3dc5230.mockapi.io/users/users/${userModel.id}'), // Use the unique identifier for the resource
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userModel.toJson()),
      );

      if (response.statusCode == 200) {
        // Data was updated successfully
        print("Data updated successfully!");
      } else {
        // Handle any errors during the request
        print("Failed to update data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      // Catch any potential exceptions
      print("Error: $e");
    }
  }

  void handleUpdate(String id) async {
    final data = UserModel(
      id: id,
      userName: userController.text,
      phonNumber: phoneController.text,
      email: emailController.text,
    );

    try {
      await updateData(data);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            formType = "add";
          });
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return sheet();
              });
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data;
                    return ListTile(
                      leading: IconButton(
                          onPressed: () {
                            setState(() {
                              formType = "update";
                            });
                            userController.text =
                                data![index].userName.toString();
                            emailController.text = data[index].email.toString();
                            phoneController.text =
                                data[index].phonNumber.toString();

                            showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    sheet(id: data[index].id.toString()));
                          },
                          icon: Icon(Icons.edit)),
                      title: Text("${data?[index].userName.toString()}"),
                      trailing: IconButton(
                          onPressed: () {
                            deleteUser(data![index].id.toString());
                          },
                          icon: Icon(Icons.delete)),
                    );
                  },
                );
        },
      ),
    );
  }

  sheet({String? id}) {
    return Container(
      child: Form(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: userController,
              decoration: InputDecoration(
                hintText: "Enter your name",
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Enter your phone",
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter your email",
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          formType == "add"
              ? ElevatedButton(
                  onPressed: () {
                    handleSubmit();
                  },
                  child: Text("Submit"))
              : ElevatedButton(
                  onPressed: () {
                    handleUpdate(id.toString());
                  },
                  child: Text("update"))
        ],
      )),
    );
  }
}
