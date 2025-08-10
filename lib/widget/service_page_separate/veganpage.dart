import 'package:flutter/material.dart';

class VeganPage extends StatefulWidget {
  const VeganPage({super.key});

  @override
  State<VeganPage> createState() => _VeganPageState();
}

class _VeganPageState extends State<VeganPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      //
      color: const Color.fromARGB(255, 1, 98, 83),
    );
  }
}
