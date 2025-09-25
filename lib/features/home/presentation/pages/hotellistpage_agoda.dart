import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tirthofy_code_1/features/home/presentation/pages/hoteldetailsPage_agoda.dart';

class HotellistpageAgoda extends StatefulWidget {
  final String destination;
  final String destId;

  const HotellistpageAgoda({
    super.key,
    required this.destination,
    required this.destId,
  });

  @override
  State<HotellistpageAgoda> createState() => _HotellistpageAgodaState();
}

class _HotellistpageAgodaState extends State<HotellistpageAgoda> {
  List hotels = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchHotels();
  }

  Future<void> fetchHotels() async {
    setState(() => isLoading = true);

    final url =
        'https://agoda-travel.p.rapidapi.com/agoda-app/hotels/details?propertyId=31449830';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'x-rapidapi-host': 'booking-com.p.rapidapi.com',
          'x-rapidapi-key':
              '18c7dee3ffmshc0ef7be87eedeefp1ca169jsn483331be3087',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() => hotels = data['result'] ?? []);
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hotels in ${widget.destination}")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return ListTile(
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HoteldetailspageAgoda(hotel: hotel),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
