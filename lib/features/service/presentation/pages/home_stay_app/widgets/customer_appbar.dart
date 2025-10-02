import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/home/presentation/pages/homepage.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Homepage()),
        );
      },
    ),
    title: const Text('Homestays & Villas'),
    actions: [
      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: 'INR',
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          items: const ['INR', 'USD', 'EUR']
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {},
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'New',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
