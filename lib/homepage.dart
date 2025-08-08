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
      body: Column(
        children: [
          Container(
            height: 100,
            //
            color: Colors.amberAccent,
          ),
          Container(),
        ],
      ),
    );
  }
}
