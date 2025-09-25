import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/pages/hoteldetailspage.dart';
//import 'hotel_details_page.dart';

class HotelListPage extends StatefulWidget {
  const HotelListPage({super.key});

  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  List hotels = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchHotels();
  }

  Future<void> fetchHotels() async {
    const url =
        'https://booking-com.p.rapidapi.com/v1/hotels/search?categories_filter_ids=class%3A%3A2%2Cclass%3A%3A4%2Cfree_cancellation%3A%3A1&adults_number=2&page_number=0&children_number=2&include_adjacency=true&children_ages=5%2C0&locale=en-gb&dest_type=city&filter_by_currency=AED&dest_id=-553173&order_by=popularity&units=metric&checkout_date=2025-10-15&room_number=1&checkin_date=2025-10-14';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'x-rapidapi-host': 'booking-com.p.rapidapi.com',
        'x-rapidapi-key': '18c7dee3ffmshc0ef7be87eedeefp1ca169jsn483331be3087',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        hotels = data['result'] ?? [];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception("Failed to fetch hotels");
    }
  }

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
                final hotel = hotels[index]; // 👈 define here
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HotelDetailsPage(hotel: hotel),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: hotel['max_photo_url'] != null
                          ? Image.network(
                              hotel['max_photo_url'],
                              width: 60,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.hotel),
                      title: Text(hotel['hotel_name'] ?? "No name"),
                      subtitle: Text(
                        "${hotel['review_score'] ?? 'N/A'} ⭐ | ${hotel['address'] ?? ''}",
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
