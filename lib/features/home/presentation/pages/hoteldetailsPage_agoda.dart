import 'package:flutter/material.dart';

class HoteldetailspageAgoda extends StatelessWidget {
  final Map hotel;

  const HoteldetailspageAgoda({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hotel['hotel_name'] ?? "Hotel Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hotel['max_photo_url'] != null)
              Image.network(hotel['max_photo_url']),
            const SizedBox(height: 12),
            Text(
              hotel['hotel_name'] ?? "",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(hotel['address'] ?? ""),
            const SizedBox(height: 8),
            Text("⭐ ${hotel['review_score'] ?? 'N/A'}"),
            const SizedBox(height: 16),
            Text("More details will go here..."),
          ],
        ),
      ),
    );
  }
}
