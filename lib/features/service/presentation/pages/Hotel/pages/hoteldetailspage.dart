import 'package:flutter/material.dart';

class HotelDetailsPage extends StatelessWidget {
  final Map hotel;

  const HotelDetailsPage({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hotel['hotel_name'] ?? "Hotel Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hotel['max_photo_url'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  hotel['max_photo_url'],
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              hotel['hotel_name'] ?? "",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "${hotel['review_score'] ?? 'N/A'} ⭐",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    hotel['address'] ?? "",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Price: ${hotel['price_breakdown']?['all_inclusive_price'] ?? 'N/A'} ${hotel['currencycode'] ?? ''}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Text(
              "Hotel ID: ${hotel['hotel_id'] ?? 'Unknown'}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
