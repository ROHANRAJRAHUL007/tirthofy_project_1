import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HotelDestinationSearch extends StatefulWidget {
  @override
  _HotelDestinationSearchState createState() => _HotelDestinationSearchState();
}

class _HotelDestinationSearchState extends State<HotelDestinationSearch> {
  List destinations = [];
  bool loading = false;

  Future<void> searchDestination(String query) async {
    setState(() {
      loading = true;
    });

    final url = Uri.parse(
      "https://booking-com.p.rapidapi.com/v1/hotels/search-by-coordinates?room_number=1&children_number=2&filter_by_currency=AED&page_number=0&units=metric&checkin_date=2025-10-14&locale=en-gb&categories_filter_ids=class%3A%3A2%2Cclass%3A%3A4%2Cfree_cancellation%3A%3A1&order_by=popularity&latitude=65.9667&longitude=-18.5333&adults_number=2&checkout_date=2025-10-15&children_ages=5%2C0&include_adjacency=true",
    );

    final response = await http.get(
      url,
      headers: {
        "X-RapidAPI-Key":
            "18c7dee3ffmshc0ef7be87eedeefp1ca169jsn483331be3087", // 🔑 replace with your key
        "X-RapidAPI-Host": "booking-com15.p.rapidapi.com",
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        destinations = data["data"] ?? [];
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
      appBar: AppBar(title: Text("Search Destination")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter City/Location",
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) => searchDestination(value),
            ),
          ),
          Expanded(
            child: loading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      final dest = destinations[index];
                      return ListTile(
                        title: Text(dest["label"] ?? "No name"),
                        subtitle: Text(
                          "Region: ${dest["region"] ?? "Unknown"}",
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
