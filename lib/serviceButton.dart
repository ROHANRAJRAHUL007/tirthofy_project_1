import 'package:flutter/material.dart';
//import 'package:tirthofy_code_1/secondpage.dart';
import 'package:tirthofy_code_1/widget/service_page_separate/buildingpage.dart';
import 'package:tirthofy_code_1/widget/service_page_separate/candlepage.dart';
import 'package:tirthofy_code_1/widget/service_page_separate/carpage.dart';
import 'package:tirthofy_code_1/widget/service_page_separate/donationpage.dart';
import 'package:tirthofy_code_1/widget/service_page_separate/giftpage.dart';
import 'package:tirthofy_code_1/widget/service_page_separate/pujapage.dart';
import 'package:tirthofy_code_1/widget/service_page_separate/smallcarpage.dart';
import 'package:tirthofy_code_1/widget/service_page_separate/veganpage.dart';

class Servicebutton extends StatefulWidget {
  const Servicebutton({super.key});

  @override
  State<Servicebutton> createState() => _ServicebuttonState();
}

final List<Widget> pages = [
  const BuildingPage(), // index 0
  const CandlePage(), // index 1
  const GiftPage(), // index 2
  const Carpage(), // index 3
  const SmallCarPage(), // index 4
  const DonationPage(), // index 5
  const PujaPage(), // index 6
  const VeganPage(), // index 7
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
      height: 400,
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
