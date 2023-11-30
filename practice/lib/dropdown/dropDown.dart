import 'package:flutter/material.dart';

class CustomDropDownWidget extends StatefulWidget {
  const CustomDropDownWidget({super.key});

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  List category = [
    {"name": "Phone Bill", "icon": Icons.phone},
    {"name": "Electricity", "icon": Icons.electric_bolt},
    {"name": "Insurance", "icon": Icons.insights_outlined},
  ];
  String newValue = "Select Item";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String>(
            value: category[0]["name"],
            onChanged: ((value) {
              if (value != null) {
                setState(() {
                  newValue = value;
                });
                print(newValue);
              }
            }),
            items: category
                .map((e) => DropdownMenuItem<String>(
                    value: e["name"],
                    child: Row(
                      children: [Icon(e["icon"]), Text(e["name"])],
                    )))
                .toList(),
            // items: [
            //   DropdownMenuItem(
            //       child: Text(category[0]["name"]), value: category[0]["name"]),
            //   DropdownMenuItem(
            //       child: Text(category[1]["name"]), value: category[1]["name"]),
            // ],
          )
        ],
      ),
    );
  }
}
