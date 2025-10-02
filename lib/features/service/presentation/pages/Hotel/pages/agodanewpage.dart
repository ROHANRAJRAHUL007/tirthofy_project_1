import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HotelsListPage extends StatefulWidget {
  const HotelsListPage({Key? key}) : super(key: key);

  @override
  State<HotelsListPage> createState() => _HotelsListPageState();
}

class _HotelsListPageState extends State<HotelsListPage> {
  bool isLoading = true;
  List<dynamic> hotels = [];

  @override
  void initState() {
    super.initState();
    fetchHotels();
  }

  Future<void> fetchHotels() async {
    final url = Uri.parse(
      "https://booking-com.p.rapidapi.com/v1/hotels/search-by-coordinates?page_number=0&locale=en-gb&children_number=2&checkout_date=2026-02-01&checkin_date=2026-01-31&adults_number=2&units=metric&latitude=65.9667&room_number=1&order_by=popularity&include_adjacency=true&longitude=-18.5333&categories_filter_ids=class%3A%3A2%2Cclass%3A%3A4%2Cfree_cancellation%3A%3A1&children_ages=5%2C0&filter_by_currency=AED",
    );

    try {
      final response = await http.get(
        url,
        headers: {
          "X-RapidAPI-Key":
              "18c7dee3ffmshc0ef7be87eedeefp1ca169jsn483331be3087",
          "X-RapidAPI-Host": "booking-com.p.rapidapi.com",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          hotels = data["result"] ?? [];
          isLoading = false;
        });
      } else {
        debugPrint("Failed with status: ${response.statusCode}");
        setState(() => isLoading = false);
      }
    } catch (e) {
      debugPrint("Error: $e");
      setState(() => isLoading = false);
    }
  }

  // Future<void> fetchHotels() async {
  //   final url = Uri.https(
  //     "https://booking-com.p.rapidapi.com/v1/hotels/search-by-coordinates?page_number=0&locale=en-gb&children_number=2&checkout_date=2026-02-01&checkin_date=2026-01-31&adults_number=2&units=metric&latitude=65.9667&room_number=1&order_by=popularity&include_adjacency=true&longitude=-18.5333&categories_filter_ids=class%3A%3A2%2Cclass%3A%3A4%2Cfree_cancellation%3A%3A1&children_ages=5%2C0&filter_by_currency=AED",
  //   );

  //   try {
  //     final response = await http.get(
  //       url,
  //       headers: {
  //         "X-RapidAPI-Key":
  //             "18c7dee3ffmshc0ef7be87eedeefp1ca169jsn483331be3087",
  //         "X-RapidAPI-Host": "booking-com.p.rapidapi.com",
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         hotels = data["result"] ?? [];
  //         isLoading = false;
  //       });
  //     } else {
  //       setState(() => isLoading = false);
  //     }
  //   } catch (e) {
  //     debugPrint("Error: $e");
  //     setState(() => isLoading = false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hotels")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hotels.isEmpty
          ? const Center(child: Text("No hotels found"))
          : ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                final name = hotel["hotel_name"] ?? "Hotel";
                final reviewScore = hotel["review_score"]?.toString() ?? "-";
                final address = hotel["address"] ?? "Address not available";
                final photoUrl = hotel["max_photo_url"];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: photoUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              photoUrl,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.hotel, size: 40),
                    title: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              reviewScore,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                        Text(
                          address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HotelDetailsPage(
                            hotelId: hotel["hotel_id"].toString(),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

class HotelDetailsPage extends StatefulWidget {
  final String hotelId;
  const HotelDetailsPage({Key? key, required this.hotelId}) : super(key: key);

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  bool isLoading = true;
  String description = "";

  @override
  void initState() {
    super.initState();
    fetchHotelDetails();
  }

  Future<void> fetchHotelDetails() async {
    final url = Uri.https(
      "booking-com.p.rapidapi.com",
      "/v1/hotels/description",
      {"locale": "en-gb", "hotel_id": widget.hotelId},
    );

    try {
      final response = await http.get(
        url,
        headers: {
          "X-RapidAPI-Key":
              "18c7dee3ffmshc0ef7be87eedeefp1ca169jsn483331be3087",
          "X-RapidAPI-Host": "booking-com.p.rapidapi.com",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          description = data["description"] ?? "No description available";
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      debugPrint("Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hotel Details")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
            ),
    );
  }
}
