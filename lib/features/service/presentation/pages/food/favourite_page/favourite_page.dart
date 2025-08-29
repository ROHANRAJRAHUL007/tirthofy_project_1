import 'package:flutter/material.dart';

class FavouritePageFood extends StatefulWidget {
  const FavouritePageFood({super.key});

  @override
  State<FavouritePageFood> createState() => _FavouritePageFoodState();
}

class _FavouritePageFoodState extends State<FavouritePageFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //
        title: const Text("Favourite Page"),
      ),
    );
  }
}
