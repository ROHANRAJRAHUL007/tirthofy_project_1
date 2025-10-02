import 'package:flutter/material.dart';

class AirportTab extends StatelessWidget {
  const AirportTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Airport booking coming soon...",
        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
      ),
    );
  }
}
