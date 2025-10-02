import 'package:flutter/material.dart';
import '../models/stay.dart';

class StayCard extends StatelessWidget {
  final Stay stay;

  const StayCard({super.key, required this.stay});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              stay.imageUrl,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stay.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(stay.subtitle, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Text(stay.lovedBy, style: const TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
