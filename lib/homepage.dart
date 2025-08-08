import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tirthofy",
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            //
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            //
            color: Colors.amberAccent,
          ),
          Container(
            color: const Color.fromARGB(255, 193, 52, 10),
            //
            height: 200,
          ),
          Container(
            height: 200,
            //
            color: Colors.amberAccent,
          ),
          Container(
            color: const Color.fromARGB(255, 193, 52, 10),
            //
            height: 200,
          ),
          Container(
            height: 200,
            //
            color: Colors.amberAccent,
          ),
          Container(
            color: const Color.fromARGB(255, 193, 52, 10),
            //
            height: 200,
          ),
          Container(
            height: 200,
            //
            color: Colors.amberAccent,
          ),
          Container(
            color: const Color.fromARGB(255, 193, 52, 10),
            //
            height: 200,
          ),
        ],
      ),
    );
  }
}
