import 'package:flutter/material.dart';

class Meenakshi extends StatelessWidget {
  final String mandirName;
  final String imagePath;

  const Meenakshi({
    required this.mandirName,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController donationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(mandirName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Rectangle image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Mandir name
            Text(
              mandirName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Donation box
            TextField(
              controller: donationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter donation amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.currency_rupee),
              ),
            ),
            const SizedBox(height: 20),

            // Donate button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final amount = donationController.text;
                  if (amount.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enter donation amount!')),
                    );
                  } else {
                    // Here you can add your API or payment integration
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Donated ₹$amount to $mandirName'),
                      ),
                    );
                  }
                },
                child: const Text('Donate', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
