import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/image_asset_pages/all_imagelis_to_listfood.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/image_asset_pages/all_names_to_listfood.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/widgets/foodcontainer.dart';

class Meals extends StatefulWidget {
  const Meals({super.key});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 0, 7),
          child: Text(
            "Meals",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            itemCount: mealsImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 200,
                    child: FoodcontainerBase(
                      imagePath: mealsImages[index],
                      foodName: mealsName[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
