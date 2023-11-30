import 'package:flutter/material.dart';

class ExpansivePage extends StatefulWidget {
  const ExpansivePage({super.key});

  @override
  State<ExpansivePage> createState() => _ExpansivePageState();
}

class _ExpansivePageState extends State<ExpansivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Expansive",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // ListView.builder(itemBuilder: Cont)
        ],
      ),
    );
  }
}
