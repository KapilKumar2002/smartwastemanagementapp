import 'package:flutter/material.dart';
import 'package:practice/screens/expansive.dart';
import 'package:practice/screens/homepage.dart';
import 'package:practice/screens/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  List list = [
    HomePage(),
    ExpansivePage(),
    Icon(Icons.add_circle),
    Icon(Icons.play_circle),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: list[_currentIndex],
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 218, 233, 245),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _currentIndex == 0
                          ? Color.fromARGB(255, 11, 101, 175)
                          : Colors.transparent),
                  height: 40,
                  child: Icon(
                    Icons.home,
                    color: _currentIndex == 0 ? Colors.white : Colors.grey,
                  )),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _currentIndex == 1
                        ? Color.fromARGB(255, 11, 101, 175)
                        : Colors.transparent),
                child: Icon(
                  Icons.person_search_outlined,
                  color: _currentIndex == 1 ? Colors.white : Colors.grey,
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _currentIndex == 2
                          ? Color.fromARGB(255, 11, 101, 175)
                          : Colors.transparent),
                  child: Icon(
                    Icons.add_circle_outline,
                    color: _currentIndex == 2 ? Colors.white : Colors.grey,
                  )),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _currentIndex == 3
                        ? Color.fromARGB(255, 11, 101, 175)
                        : Colors.transparent),
                child: Icon(
                  Icons.play_circle_outline_outlined,
                  color: _currentIndex == 3 ? Colors.white : Colors.grey,
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                _currentIndex = 4;
                setState(() {});
              },
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _currentIndex == 4
                          ? Color.fromARGB(255, 11, 101, 175)
                          : Colors.transparent),
                  child: Icon(
                    Icons.person_add_alt,
                    color: _currentIndex == 4 ? Colors.white : Colors.grey,
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
