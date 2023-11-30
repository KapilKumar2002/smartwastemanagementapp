import 'package:flutter/material.dart';
import 'package:practice/screens/expansive.dart';
import 'package:practice/screens/profile.dart';
import 'package:practice/screens/tutorial.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class Responsive_Navigation_Bar extends StatefulWidget {
  const Responsive_Navigation_Bar({super.key});

  @override
  State<Responsive_Navigation_Bar> createState() =>
      _Responsive_Navigation_BarState();
}

class _Responsive_Navigation_BarState extends State<Responsive_Navigation_Bar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    // List list = [
    //   HomePage(),
    //   ExpansivePage(),
    //   ProfilePage(),
    // ];

    Widget getBody() {
      List<Widget> pages = [
        Container(
          alignment: Alignment.center,
          child: Text(
            "Home",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Users",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Messages",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ];
      return IndexedStack(
        index: _selectedIndex,
        children: pages,
      );
    }

    return Scaffold(
      body: getBody(),
      bottomNavigationBar: ResponsiveNavigationBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xff3c3c3c)
            : const Color(0xffbebebe),
        inactiveIconColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xffaaaaaa)
            : const Color(0xff969696),
        borderRadius: 0,
        selectedIndex: _selectedIndex,
        onTabChange: (p0) {
          setState(() {
            _selectedIndex = p0;
          });
        },
        showActiveButtonText: false,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        navigationBarButtons: const <NavigationBarButton>[
          NavigationBarButton(
            icon: Icons.people,
            backgroundGradient: LinearGradient(
              colors: [Colors.yellow, Colors.green, Colors.blue],
            ),
          ),
          NavigationBarButton(
            icon: Icons.star,
            backgroundGradient: LinearGradient(
              colors: [Colors.cyan, Colors.teal],
            ),
          ),
          NavigationBarButton(
            icon: Icons.settings,
            backgroundGradient: LinearGradient(
              colors: [Colors.green, Colors.yellow],
            ),
          ),
          NavigationBarButton(
            icon: Icons.home,
            backgroundGradient: LinearGradient(
              colors: [Colors.green, Colors.yellow],
            ),
          ),
          // NavigationBarButton(
          //   icon: Icons.person,
          //   backgroundGradient: LinearGradient(
          //     colors: [Colors.green, Colors.yellow],
          //   ),
          // ),
        ],
      ),
    );
  }
}
