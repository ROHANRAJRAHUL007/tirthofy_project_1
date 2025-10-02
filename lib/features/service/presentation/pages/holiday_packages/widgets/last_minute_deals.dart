import 'package:flutter/material.dart';

class LastMinuteDeals extends StatelessWidget {
  const LastMinuteDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Last-minute Deals",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text("Lowest price guaranteed for last minute holiday packages!"),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            icon: const Icon(Icons.edit, color: Colors.white),
            label: const Text(
              "Customise my trip",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
