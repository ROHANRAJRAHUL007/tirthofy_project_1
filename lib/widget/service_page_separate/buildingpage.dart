import 'package:flutter/material.dart';

class BuildingPage extends StatefulWidget {
  const BuildingPage({super.key});

  @override
  State<BuildingPage> createState() => _BuildingPageState();
}

class _BuildingPageState extends State<BuildingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      //
      color: Colors.deepPurple,
    );
  }
}
