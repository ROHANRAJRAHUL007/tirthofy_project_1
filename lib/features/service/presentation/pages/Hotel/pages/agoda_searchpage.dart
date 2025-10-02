// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Agodasearchpage extends StatefulWidget {
//   const Agodasearchpage({super.key});

//   @override
//   State<Agodasearchpage> createState() => _AgodasearchpageState();
// }

// class _AgodasearchpageState extends State<Agodasearchpage> {
//   String destination = "";
//   List suggestions = [];
//   bool isLoading = false;

//   final TextEditingController _controller = TextEditingController();

//   // Fetch autocomplete suggestions
//   Future<void> fetchSuggestions(String query) async {
//     if (query.isEmpty) {
//       setState(() => suggestions = []);
//       return;
//     }

//     setState(() => isLoading = true);

//     final url =
//         'https://booking-com.p.rapidapi.com/v1/hotels/locations?locale=en-gb&name=$query';

//     try {
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {
//           'x-rapidapi-host': 'booking-com.p.rapidapi.com',
//           'x-rapidapi-key':
//               '18c7dee3ffmshc0ef7be87eedeefp1ca169jsn483331be3087',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           suggestions = data; // list of places
//         });
//       } else {
//         setState(() => suggestions = []);
//       }
//     } catch (e) {
//       setState(() => suggestions = []);
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Hotel Autocomplete")),
//       body: Column(
//         children: [
//           // 🔹 Destination TextField
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 labelText: "Destination",
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onChanged: (value) {
//                 destination = value;
//                 fetchSuggestions(value); // call API as user types
//               },
//             ),
//           ),

//           // 🔹 Loading bar
//           if (isLoading) const LinearProgressIndicator(),

//           // 🔹 Suggestion List
//           Expanded(
//             child: ListView.builder(
//               itemCount: suggestions.length,
//               itemBuilder: (context, index) {
//                 final item = suggestions[index];
//                 return ListTile(
//                   leading: const Icon(Icons.location_on),
//                   title: Text(item['name'] ?? "Unknown"),
//                   subtitle: Text("${item['dest_type'] ?? ''}"),
//                   onTap: () {
//                     // when suggestion tapped → fill TextField
//                     _controller.text = item['name'] ?? "";
//                     destination = item['name'] ?? "";
//                     setState(() => suggestions = []); // hide list

//                     // 👇 Navigate to HotelListPage
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HotelListPage(
//                           locationId: item['dest_id'].toString(),
//                           locationName: item['name'] ?? "Unknown",
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // 🔹 Dummy Hotel List Page
// class HotelListPage extends StatelessWidget {
//   final String locationId;
//   final String locationName;

//   const HotelListPage({
//     super.key,
//     required this.locationId,
//     required this.locationName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Hotels in $locationName")),
//       body: Center(
//         child: Text(
//           "Showing hotels for $locationName (ID: $locationId)",
//           style: const TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }
