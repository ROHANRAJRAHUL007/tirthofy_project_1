import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TravelInsurancePage extends StatefulWidget {
  const TravelInsurancePage({super.key});

  @override
  State<TravelInsurancePage> createState() => _TravelInsurancePageState();
}

class _TravelInsurancePageState extends State<TravelInsurancePage> {
  // Dynamic Data
  final List<String> destinations = [
    "Thailand",
    "UAE",
    "USA",
    "Singapore",
    "Europe",
  ];

  List<String> selectedDestinations = [];
  DateTime? startDate;
  DateTime? endDate;
  int travellers = 1;
  String selectedPlan = "Regular";

  // Select Date
  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateRangeText = (startDate != null && endDate != null)
        ? "${DateFormat("dd MMM yyyy").format(startDate!)} - ${DateFormat("dd MMM yyyy").format(endDate!)}"
        : "Select Travel Dates";

    return Scaffold(
      appBar: AppBar(
        title: const Text("International Travel + Medical Insurance"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Upto 40% Lesser Insurance Premium\nAlso use wallet balance to pay",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),

            // Travel Destination
            const Text(
              "Travel Destination",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text("You can select multiple destinations"),
            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: destinations.map((dest) {
                bool isSelected = selectedDestinations.contains(dest);
                return ChoiceChip(
                  label: Text(dest),
                  selected: isSelected,
                  onSelected: (val) {
                    setState(() {
                      if (isSelected) {
                        selectedDestinations.remove(dest);
                      } else {
                        selectedDestinations.add(dest);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Date Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Travel Dates",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: _pickDateRange,
                  icon: const Icon(Icons.calendar_today),
                  label: Text(dateRangeText),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Travellers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "No. of Travellers",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (travellers > 1) {
                          setState(() => travellers--);
                        }
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text("$travellers", style: const TextStyle(fontSize: 18)),
                    IconButton(
                      onPressed: () {
                        setState(() => travellers++);
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Special Plans
            const Text(
              "Special Plans (Optional)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                ChoiceChip(
                  label: const Text("Regular"),
                  selected: selectedPlan == "Regular",
                  onSelected: (_) {
                    setState(() => selectedPlan = "Regular");
                  },
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text("Student"),
                  selected: selectedPlan == "Student",
                  onSelected: (_) {
                    setState(() => selectedPlan = "Student");
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Explore Plans Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.search, color: Colors.white),
                label: const Text(
                  "EXPLORE PLANS",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  // Handle API / Next Page
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Destinations: $selectedDestinations\n"
                        "Dates: $dateRangeText\n"
                        "Travellers: $travellers\n"
                        "Plan: $selectedPlan",
                      ),
                    ),
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
