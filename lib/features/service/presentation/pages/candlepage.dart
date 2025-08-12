// TODO Implement this library.
import 'package:flutter/material.dart';

class Candlepage extends StatefulWidget {
  const Candlepage({super.key});

  @override
  State<Candlepage> createState() => _CandlepageState();
}

class _CandlepageState extends State<Candlepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: const Color.fromARGB(255, 116, 91, 1),
    );
  }
}
