import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/destination_card.dart';

class BlogHomePage extends StatelessWidget {
  BlogHomePage({super.key});

  final List<Destination> destinations = [
    Destination(
      name: "Kochi",
      subtitle: "A Charming Port City in Kerala",
      tags: const [
        "Backwater Cruises",
        "Spice Markets",
        "Colonial Architecture",
      ],
      imageUrl: "assets/images/imageadhomepage/murudeswara.png",
      isTrending: false,
    ),
    Destination(
      name: "Phuket",
      subtitle: "Thailand's Island Paradise",
      tags: const ["Tropical Beaches", "Nightlife", "Island Hopping"],
      imageUrl: "assets/images/imageadhomepage/murudeswara.png",
      isTrending: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 10),
            const Text(
              "Discover your next travel destination",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Travel Stories & Inspirations",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Show me the best palace hotels in Udaipur.",
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: const Icon(Icons.search, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text(
                  "Where You Should Go ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "Next?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                Spacer(),
                Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade50,
                foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
              label: const Text("Pick your vibe with easy filters"),
            ),
            const SizedBox(height: 16),

            // Horizontal scroll
            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  return DestinationCard(destination: destinations[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
