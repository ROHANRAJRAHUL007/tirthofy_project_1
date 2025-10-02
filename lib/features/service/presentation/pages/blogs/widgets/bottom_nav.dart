import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_travel),
          label: "My Trips",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "myra.AI"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Where2Go"),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          label: "Credit Card",
        ),
      ],
    );
  }
}
