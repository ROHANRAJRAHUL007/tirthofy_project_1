import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/flight/flightsearchpage.dart';

class FlighthomepageUI extends StatefulWidget {
  const FlighthomepageUI({super.key});

  @override
  State<FlighthomepageUI> createState() => _FlighthomepageUIState();
}

class _FlighthomepageUIState extends State<FlighthomepageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Hotels")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Booking.com
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HotelsListPage()),
              // );
            },
            child: Row(
              children: [
                // const CircleAvatar(
                //   backgroundImage: AssetImage(
                //     "assets/images/hotel_images/agoda.png",
                //   ),
                // ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/hotel_images/agoda.png",
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'Agoda',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Goibibo
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FlightSearchPage()),
              );
            },
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/hotel_images/goibibo.jpg",
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'Goibibo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Ad section
          // Hotelhomepagead(),
        ],
      ),
    );
  }
}
