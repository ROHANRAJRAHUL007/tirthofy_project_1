import 'package:flutter/material.dart';

class FlightSearchPage extends StatefulWidget {
  const FlightSearchPage({super.key});

  @override
  State<FlightSearchPage> createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  // Dynamic state variables
  String tripType = "ONE WAY";
  String fromCity = "Mangalore IXE";
  String fromAirport = "Mangalore International Airport";
  String toCity = "Kolkata CCU";
  String toAirport = "Netaji Subhash Chandra Bose International";
  DateTime departureDate = DateTime(2025, 10, 21);
  DateTime? returnDate;
  int travellers = 1;
  String travelClass = "Economy/Premium Economy";
  bool delayProtection = false;

  final List<String> tripTypes = ["ONE WAY", "ROUNDTRIP", "MULTICITY"];

  final List<Map<String, dynamic>> fares = [
    {"label": "Student", "icon": Icons.school},
    {"label": "Senior Citizen", "icon": Icons.elderly},
    {"label": "Armed Forces", "icon": Icons.shield},
  ];

  // Date formatter
  String formatDate(DateTime date) {
    return "${date.day} ${_monthName(date.month)} ${date.year}";
  }

  String _monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flight Search"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trip Type Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: tripTypes.map((type) {
                return ChoiceChip(
                  label: Text(type),
                  selected: tripType == type,
                  onSelected: (selected) {
                    setState(() {
                      tripType = type;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // From - To
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.flight_takeoff),
                    title: Text(fromCity),
                    subtitle: Text(fromAirport),
                    onTap: () {
                      // TODO: Add search city picker
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.flight_land),
                    title: Text(toCity),
                    subtitle: Text(toAirport),
                    onTap: () {
                      // TODO: Add search city picker
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Departure Date + Return Date
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: Text(formatDate(departureDate)),
                      subtitle: Text(
                        "${departureDate.weekday == DateTime.tuesday ? 'Tue' : ''}, ${departureDate.year}",
                      ),
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: departureDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        );
                        if (picked != null) {
                          setState(() {
                            departureDate = picked;
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.add_circle_outline),
                      title: Text(
                        returnDate == null
                            ? "+ Add Return Date"
                            : formatDate(returnDate!),
                      ),
                      subtitle: const Text("Save more on round trips!"),
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: departureDate,
                          firstDate: departureDate,
                          lastDate: DateTime(2030),
                        );
                        if (picked != null) {
                          setState(() {
                            returnDate = picked;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Travellers & Class
            Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text("$travellers, $travelClass"),
                subtitle: const Text("Travellers & Class"),
                onTap: () {
                  // TODO: Show travellers/class selection dialog
                },
              ),
            ),
            const SizedBox(height: 20),

            // Special fares
            Text(
              "SPECIAL FARES (OPTIONAL)",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: fares.map((fare) {
                return Chip(
                  label: Text(fare["label"]),
                  avatar: Icon(fare["icon"], size: 18),
                  backgroundColor: Colors.grey.shade200,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Flight Delay Protection
            CheckboxListTile(
              value: delayProtection,
              onChanged: (val) {
                setState(() {
                  delayProtection = val ?? false;
                });
              },
              title: const Text("Add Flight Delay Protection"),
              subtitle: const Text(
                "Get compensation for delays of 1 hour or more",
              ),
              secondary: const Icon(Icons.verified_user),
            ),
            const SizedBox(height: 20),

            // Search Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Collect data dynamically
                  print("Searching Flights...");
                  print("From: $fromCity → $toCity");
                  print("Departure: ${formatDate(departureDate)}");
                  print(
                    "Return: ${returnDate != null ? formatDate(returnDate!) : "N/A"}",
                  );
                  print("Travellers: $travellers, Class: $travelClass");
                  print("Trip Type: $tripType");
                  print("Delay Protection: $delayProtection");
                },
                child: const Text(
                  "Search Flights",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
