import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class NewSearchPage extends StatefulWidget {
  const NewSearchPage({super.key});

  @override
  State<NewSearchPage> createState() => _NewSearchPageState();
}

class _NewSearchPageState extends State<NewSearchPage> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController pickupsearchController = TextEditingController();
  final TextEditingController dropsearchController = TextEditingController();

  final uuid = const Uuid();
  String sessionToken = '';
  List<dynamic> placesList = [];
  List<dynamic> pickupPlacesList = [];
  List<dynamic> dropoffPlacesList = [];
  String activeField = "";

  // Your API Key here
  static const String apiKey = "AIzaSyCXtNAaIJFFA2lI1-HdWoztUytFJdpbxQs";

  void onChangedHandler(String input, String fieldType) {
    setState(() {
      activeField = fieldType;
      if (sessionToken.isEmpty) {
        sessionToken = uuid.v4();
      }
    });
    getSuggestions(input, fieldType);
  }

  Future<void> getSuggestions(String input, String fieldType) async {
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$apiKey&sessiontoken=$sessionToken'
        '&location=12.9716,77.5946&radius=50000';

    var response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == "OK") {
        setState(() {
          if (fieldType == "pickup") {
            pickupPlacesList = data['predictions'];
          } else {
            dropoffPlacesList = data['predictions'];
          }
        });
      } else {
        print("API Error: ${data['status']} - ${data['error_message']}");
      }
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  Future<void> getPlaceDetails(String placeId, String fieldType) async {
    String detailsUrl =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    var response = await http.get(Uri.parse(detailsUrl));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['result'];
      var location = result['geometry']['location'];

      double lat = (location['lat'] as num).toDouble();
      double lng = (location['lng'] as num).toDouble();

      print("Selected Place: ${result['name']} ($fieldType)");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Selected: ${result['name']}")));

      setState(() {
        if (fieldType == "pickup") {
          pickupsearchController.text = result['name'];
          pickupPlacesList = [];
        } else {
          dropsearchController.text = result['name'];
          dropoffPlacesList = [];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 5),
        child: Column(
          children: [
            // Pickup Field
            TextField(
              controller: pickupsearchController,
              onChanged: (value) => onChangedHandler(value, "pickup"),
              decoration: InputDecoration(
                hintText: "From Where to go?",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),

            // Dropoff Field
            TextField(
              controller: dropsearchController,
              onChanged: (value) => onChangedHandler(value, "dropoff"),
              decoration: InputDecoration(
                hintText: "Where to go?",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            // Suggestions List
            Expanded(
              child: ListView.builder(
                itemCount: activeField == "pickup"
                    ? pickupPlacesList.length
                    : dropoffPlacesList.length,
                itemBuilder: (context, index) {
                  final suggestion = activeField == "pickup"
                      ? pickupPlacesList[index]
                      : dropoffPlacesList[index];

                  return ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(suggestion['description']),
                    onTap: () {
                      String placeId = suggestion['place_id'];
                      getPlaceDetails(placeId, activeField);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
