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

final List<IconData> icons = [
  Icons.apartment, // building
  Icons.food_bank_rounded, // food
  Icons.card_giftcard, // gift
  Icons.directions_car, // car
  Icons.motorcycle_rounded, // motorcycle icon
  Icons.attach_money_rounded, // money
  Icons.temple_hindu, // Temple,
  Icons.more_horiz_rounded, // more
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
        itemCount: icons.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (index == icons.length - 1) {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text('More option'),
                          ListTile(
                            leading: const Icon(Icons.star),
                            title: Text('special service'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              }
            },
            child: Container(
              color: const Color.fromARGB(0, 255, 255, 255),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color.fromARGB(255, 255, 110, 64),
                    child: Icon(
                      icons[index],
                      //
                      size: 30,
                      color: Colors.black87,
                    ),
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
