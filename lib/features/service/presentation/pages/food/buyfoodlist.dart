import 'package:flutter/material.dart';

class Buyfoodlist extends StatefulWidget {
  const Buyfoodlist({super.key});

  @override
  State<Buyfoodlist> createState() => _BuyfoodlistState();
}

class _BuyfoodlistState extends State<Buyfoodlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 300,
        // width: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),

          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: const Color.fromARGB(255, 255, 110, 64),
                  height: 200,
                  width: 270,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
