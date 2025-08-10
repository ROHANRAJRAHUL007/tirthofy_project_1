import 'package:flutter/material.dart';

class Carpage extends StatefulWidget {
  const Carpage({super.key});

  @override
  State<Carpage> createState() => _CarpageState();
}

class _CarpageState extends State<Carpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      //
      color: const Color.fromARGB(255, 255, 111, 1),
    );
  }
}
