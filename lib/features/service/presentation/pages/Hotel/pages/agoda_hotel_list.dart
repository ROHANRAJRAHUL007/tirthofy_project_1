import 'package:flutter/material.dart';

class AgodaHotelList extends StatelessWidget {
  final String destination;
  final String destId;

  const AgodaHotelList({
    super.key,
    required this.destination,
    required this.destId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hotels in $destination")),
      body: Center(
        child: Text(
          "Showing hotels for $destination (ID: $destId)",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
