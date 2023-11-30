import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [
    {"name": "Shoes", "amount": "\$125"},
    {"name": "Pant", "amount": "\$15"},
    {"name": "Trouser", "amount": "\$25"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    height: MediaQuery.of(context).size.width / 2 - 20,
                    decoration: BoxDecoration(color: Colors.pink),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    height: MediaQuery.of(context).size.width / 2 - 20,
                    decoration: BoxDecoration(color: Colors.pink),
                  )
                ],
              ),
              ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        tileColor: Colors.grey,
                        shape: RoundedRectangleBorder(),
                        title: Text(list[index]["name"]),
                        subtitle: Text("subtitle"),
                        leading: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.amberAccent),
                          child: Image.asset(
                            "assets/images/star.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                        trailing: Text(list[index]['amount']),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
