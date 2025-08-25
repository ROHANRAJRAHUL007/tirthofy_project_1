// TODO Implement this library.
import 'package:flutter/material.dart';

class Buildingpage extends StatefulWidget {
  const Buildingpage({super.key});

  @override
  State<Buildingpage> createState() => _BuildingpageState();
}

class _BuildingpageState extends State<Buildingpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //1
        Container(height: 100, width: 100, color: Colors.amber),
        SizedBox(height: 10),
        //2
        Container(height: 100, width: 100, color: Colors.amber),
        //3
        Container(height: 100, width: 100, color: Colors.amber),
      ],
    );
  }
}
