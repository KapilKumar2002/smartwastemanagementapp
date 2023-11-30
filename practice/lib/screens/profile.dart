import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 61, 107),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("My App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 125,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 275,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
