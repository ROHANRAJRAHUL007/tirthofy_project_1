import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/holiday_packages/models/destination_models.dart';

import '../widgets/package_header.dart';
import '../widgets/best_destinations.dart';
import '../widgets/last_minute_deals.dart';

class HolidayPackagesPage extends StatefulWidget {
  const HolidayPackagesPage({Key? key}) : super(key: key);

  @override
  State<HolidayPackagesPage> createState() => _HolidayPackagesPageState();
}

class _HolidayPackagesPageState extends State<HolidayPackagesPage> {
  // dynamic state (can be replaced by API/Firestore later)
  String startingFrom = 'Select city';
  String travellingTo = 'Select destination';
  String? startDate;
  int adults = 2;
  int rooms = 1;

  final List<String> cities = [
    'New Delhi',
    'Mumbai',
    'Bengaluru',
    'Chennai',
    'Kolkata',
    'Hyderabad',
    'Srinagar',
    'Jammu',
    'Shimla',
    'Dharamshala',
    'Chandigarh',
    'Dehradun',
    'Lucknow',
    'Jaipur',
    'Gandhinagar',
    'Mumbai',
    'Bhopal',
    'Raipur',
    'Patna',
    'Ranchi',
    'Bhubaneswar',
    'Visakhapatnam',
    'Thiruvananthapuram',
    'Agartala',
    'Shillong',
  ];

  final List<Destination> bestDestinations = [
    Destination(name: 'Ayodha', image: 'https://picsum.photos/id/1018/200/200'),
    Destination(name: 'kashi', image: 'https://picsum.photos/id/1015/200/200'),
    Destination(
      name: 'Kamayaka',
      image: 'https://picsum.photos/id/1016/200/200',
    ),
    Destination(name: 'Matura', image: 'https://picsum.photos/id/1011/200/200'),
  ];

  void _updateStartingFrom(String v) => setState(() => startingFrom = v);
  void _updateTravellingTo(String v) => setState(() => travellingTo = v);
  void _updateDate(String v) => setState(() => startDate = v);
  void _updateGuests(int a, int r) => setState(() {
    adults = a;
    rooms = r;
  });

  void _searchPackages() {
    final msg =
        '''
Searching:
From: $startingFrom
To: $travellingTo
Date: ${startDate ?? 'Not selected'}
Guests: $adults adults, $rooms rooms
''';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Holiday Packages'),
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PackageHeader(
              startingFrom: startingFrom,
              travellingTo: travellingTo,
              startDate: startDate,
              adults: adults,
              rooms: rooms,
              cities: cities,
              destinations: bestDestinations,
              onStartingFromChanged: _updateStartingFrom,
              onTravellingToChanged: _updateTravellingTo,
              onDateChanged: _updateDate,
              onGuestsChanged: _updateGuests,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: const Text('All Filters'),
                  onSelected: (_) {},
                ),
                FilterChip(label: const Text('Duration'), onSelected: (_) {}),
                FilterChip(label: const Text('Flights'), onSelected: (_) {}),
                FilterChip(label: const Text('Budget'), onSelected: (_) {}),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _searchPackages,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('SEARCH'),
              ),
            ),
            const SizedBox(height: 25),
            BestDestinations(bestDestinations: bestDestinations),
            const SizedBox(height: 25),
            const LastMinuteDeals(),
          ],
        ),
      ),
    );
  }
}
