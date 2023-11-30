import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 10,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                backgroundColor: Colors.blue,
                unselectedBackgroundColor: Colors.blue[50],
                unselectedLabelStyle: const TextStyle(color: Colors.blue),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.directions_car),
                    text: "car",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_transit),
                    text: "transit",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_car),
                    text: "car",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_transit),
                    text: "transit",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_car),
                    text: "car",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_transit),
                    text: "transit",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_car),
                    text: "car",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_transit),
                    text: "transit",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_car),
                    text: "car",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_transit),
                    text: "transit",
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: Icon(Icons.directions_car),
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                    Center(
                      child: Icon(Icons.directions_car),
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                    Center(
                      child: Icon(Icons.directions_car),
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
