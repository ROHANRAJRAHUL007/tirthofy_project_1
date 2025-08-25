import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/buyfoodlist.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/optionfood.dart';

class Foodpage extends StatefulWidget {
  const Foodpage({super.key});

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:
            //
            [
              Optionfood(),
              Expanded(child: Buyfoodlist()),
            ],
      ),

      //
    );
  }
}
