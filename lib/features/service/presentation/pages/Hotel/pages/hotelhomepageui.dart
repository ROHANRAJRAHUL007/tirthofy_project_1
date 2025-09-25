import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/pages/booking.com.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/pages/agoda_searchpage.dart';

import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/pages/goibibo.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/pages/hotelhomepagead.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/pages/hotellist_page.dart';

class Hotelhomepageui extends StatefulWidget {
  const Hotelhomepageui({super.key});

  @override
  State<Hotelhomepageui> createState() => _HotelhomepageuiState();
}

class _HotelhomepageuiState extends State<Hotelhomepageui> {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Agodasearchpage()),
              );
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
                MaterialPageRoute(builder: (context) => Goibibo()),
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
          Hotelhomepagead(),
        ],
      ),
    );
  }
}
