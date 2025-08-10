import 'package:flutter/material.dart';

class Servicebutton extends StatefulWidget {
  const Servicebutton({super.key});

  @override
  State<Servicebutton> createState() => _ServicebuttonState();
}

final List<String> images = [
  'assets/images/building_16279860.png',
  'assets/images/candle_3479462.png',
  'assets/images/gift_2349798.png',
  'assets/images/hatchback_6469044.png',
  'assets/images/icons8-car-24.png',
  'assets/images/love_7359018.png',
  'assets/images/puja_17729044.png',
  'assets/images/vegan_5465117.png',
];

class _ServicebuttonState extends State<Servicebutton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: const Color.fromARGB(0, 255, 255, 255),
            child: Row(
              children: [
                CircleAvatar(
                  //
                  radius: 30,
                  backgroundImage: AssetImage(
                    images[index],
                  ), // each gets its own image
                  backgroundColor: Colors.grey[200],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
