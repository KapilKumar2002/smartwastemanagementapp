import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black,
                  width: (MediaQuery.of(context).size.width * .5) - 10,
                  height: (MediaQuery.of(context).size.width * .5) - 10,
                ),
                Container(
                  color: Colors.black,
                  width: (MediaQuery.of(context).size.width * .5) - 10,
                  height: (MediaQuery.of(context).size.width * .5) - 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
