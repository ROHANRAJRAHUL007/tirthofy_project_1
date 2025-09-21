import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RoomAvailabilityPage extends StatefulWidget {
  final String hotelId;
  const RoomAvailabilityPage({required this.hotelId});

  @override
  _RoomAvailabilityPageState createState() => _RoomAvailabilityPageState();
}

class _RoomAvailabilityPageState extends State<RoomAvailabilityPage> {
  List rooms = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchRooms();
  }

  Future<void> fetchRooms() async {
    final url = Uri.parse(
      "https://booking-com15.p.rapidapi.com/api/v1/hotels/getRoomList"
      "?hotel_id=${widget.hotelId}&checkin_date=2025-09-20&checkout_date=2025-09-21&adults=1&children_age=0&rooms=1",
    );

    final response = await http.get(
      url,
      headers: {
        "X-RapidAPI-Key": "18c7dee3ffmshc0ef7be87eedeefp1ca169jsn483331be3087",
        "X-RapidAPI-Host": "booking-com15.p.rapidapi.com",
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        rooms = data["data"]["rooms"] ?? [];
        loading = false;
      });
    } else {
      print("Error: ${response.body}");
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Rooms")),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(room["name"] ?? "Room"),
                    subtitle: Text(
                      "Price: ${room["priceBreakdown"]?["grossPrice"]?["value"] ?? "N/A"} ${room["priceBreakdown"]?["grossPrice"]?["currency"] ?? ""}",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
