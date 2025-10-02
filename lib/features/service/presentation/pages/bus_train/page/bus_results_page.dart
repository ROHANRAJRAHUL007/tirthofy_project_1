import 'package:flutter/material.dart';
import '../widgets/bus_card.dart';

class BusResultsPage extends StatelessWidget {
  const BusResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> buses = [
      {
        "operator": "Shree Savariya Travels & Transport",
        "type": "A/C Sleeper (2+1)",
        "departure": "12:15",
        "duration": "39h 15m",
        "arrival": "03:30 +1 day",
        "price": 2999,
        "seats": 21,
        "singleSeats": 2,
        "tag": "Cheapest",
      },
      {
        "operator": "NTC Nagpur Travels",
        "type": "A/C Sleeper (2+1)",
        "departure": "13:00",
        "duration": "43h 00m",
        "arrival": "08:05 +1 day",
        "price": 4000,
        "seats": 17,
        "singleSeats": 5,
        "tag": "",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Buses"),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: buses.length,
        itemBuilder: (context, index) {
          final bus = buses[index];
          return BusCard(
            operatorName: bus["operator"],
            type: bus["type"],
            departure: bus["departure"],
            duration: bus["duration"],
            arrival: bus["arrival"],
            price: bus["price"],
            seats: bus["seats"],
            singleSeats: bus["singleSeats"],
            tag: bus["tag"],
          );
        },
      ),
    );
  }
}
