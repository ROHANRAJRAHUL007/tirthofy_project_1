import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      elevation: 0,
      title: const Text("Deliver to Ngurah Rai Interna..."),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.receipt)),
      ],
    );
  }
}
