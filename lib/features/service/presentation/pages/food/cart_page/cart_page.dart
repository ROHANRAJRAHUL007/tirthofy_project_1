import 'package:flutter/material.dart';

class CartPageFood extends StatefulWidget {
  const CartPageFood({super.key});

  @override
  State<CartPageFood> createState() => _CartPageFoodState();
}

class _CartPageFoodState extends State<CartPageFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //
        title: Text("Cart page"),
      ),
    );
  }
}
