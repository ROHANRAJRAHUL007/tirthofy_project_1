import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/pujaa/models/puja_models.dart';

import '../widgets/pooja_card.dart';

class PoojaBookingScreen extends StatelessWidget {
  final List<Pooja> poojaList = [
    Pooja(
      title: 'Dwarka Darshan Pooja',
      price: '₹1499',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/1/16/Dwarkadheesh_temple.jpg',
    ),
    Pooja(
      title: 'Grishneshwar – Abhishek Pooja',
      price: '₹699',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/3/36/Grishneshwar_Temple.jpg',
    ),
    Pooja(
      title: 'Jagannath Pooja – Darshan Vedic',
      price: '₹1199',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/2/29/Jagannath_Temple%2C_Puri.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: Text("Pooja Booking"),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search by Pooja Name",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Pooja list
          Expanded(
            child: ListView.builder(
              itemCount: poojaList.length,
              itemBuilder: (context, index) {
                return PoojaCard(pooja: poojaList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
