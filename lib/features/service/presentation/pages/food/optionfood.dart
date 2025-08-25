import 'package:flutter/material.dart';

class Optionfood extends StatefulWidget {
  const Optionfood({super.key});

  @override
  State<Optionfood> createState() => _OptionfoodState();
}

class _OptionfoodState extends State<Optionfood> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      //  width: 800,
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Container(height: 100, width: 100, color: Colors.blue);
        },
      ),
    );
  }
}
