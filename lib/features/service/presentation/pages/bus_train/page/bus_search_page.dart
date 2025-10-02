import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/offer_card.dart';
import 'bus_results_page.dart';

class BusSearchPage extends StatefulWidget {
  const BusSearchPage({super.key});

  @override
  State<BusSearchPage> createState() => _BusSearchPageState();
}

class _BusSearchPageState extends State<BusSearchPage> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat("d MMM, EEEE, yyyy").format(selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bus Search"),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: fromController,
              decoration: InputDecoration(
                labelText: "FROM",
                hintText: "Enter City Name",
                prefixIcon: const Icon(Icons.location_on_outlined),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.swap_vert),
                  onPressed: () {
                    String temp = fromController.text;
                    fromController.text = toController.text;
                    toController.text = temp;
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: toController,
              decoration: InputDecoration(
                labelText: "TO",
                hintText: "Enter City Name",
                prefixIcon: const Icon(Icons.location_on_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 12),
                    Text(formattedDate, style: const TextStyle(fontSize: 16)),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedDate = DateTime.now();
                        });
                      },
                      child: const Text("Today"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedDate = DateTime.now().add(
                            const Duration(days: 1),
                          );
                        });
                      },
                      child: const Text("Tomorrow"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BusResultsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "SEARCH BUSES",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "OFFERS",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  OfferCard(
                    title: "Save big on your next getaway: Grab up to 15% OFF",
                    subtitle: "Valid on Central Bank of India Debit Cards",
                    image: "assets/images/offer1.jpg",
                  ),
                  OfferCard(
                    title: "Epic Deals: Grab up to 20% OFF",
                    subtitle: "Valid on Canara Bank Debit Cards",
                    image: "assets/images/offer2.jpg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
