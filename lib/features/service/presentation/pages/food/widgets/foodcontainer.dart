import 'package:flutter/material.dart';

import 'package:tirthofy_code_1/features/service/presentation/pages/food/widgets/addbutton.dart';

class FoodcontainerBase extends StatefulWidget {
  final String imagePath;
  final String foodName;
  const FoodcontainerBase({
    super.key,
    required this.imagePath,
    required this.foodName,
  });

  @override
  State<FoodcontainerBase> createState() => _FoodcontainerBaseState();
}

class _FoodcontainerBaseState extends State<FoodcontainerBase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(243, 255, 234, 0),
      height: 400,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 200,
                width: 200,
                padding: EdgeInsets.all(6),

                child: ClipRRect(
                  //
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(widget.imagePath, fit: BoxFit.cover),
                ),
              ),
              Text(widget.foodName),
              SizedBox(height: 3),
              AddButton(),
            ],
          ),
        ],
      ),
    );
  }
}
