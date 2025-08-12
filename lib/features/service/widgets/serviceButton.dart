import 'package:flutter/material.dart';
//import 'package:tirthofy_code_1/secondpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/buildingpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/candlepage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donationpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/giftpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/pujapage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/smallcarpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/veganpage.dart';

class Servicebutton extends StatefulWidget {
  const Servicebutton({super.key});

  @override
  State<Servicebutton> createState() => _ServicebuttonState();
}

final List<Widget> pages = [
  const Buildingpage(), // index 0
  const Candlepage(), // index 1
  const Giftpage(), // index 2
  const Carpage(), // index 3
  const Smallcarpage(), // index 4
  const Donationpage(), // index 5
  const Pujapage(), // index 6
  const Veganpage(), // index 7
];

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
      height: 200,
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pages[index]),
              );
            },
            child: Container(
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
            ),
          );
        },
      ),
    );
  }
}
