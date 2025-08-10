import 'package:flutter/material.dart';

class SmallCarPage extends StatefulWidget {
  const SmallCarPage({super.key});

  @override
  State<SmallCarPage> createState() => _SmallCarPageState();
}

class _SmallCarPageState extends State<SmallCarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      //
      color: const Color.fromARGB(255, 0, 125, 227),
    );
  }
}
