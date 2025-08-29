import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/image_asset_pages/all_imagelis_to_listfood.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/image_asset_pages/all_names_to_listfood.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/widgets/foodcontainer.dart';

class Under99 extends StatefulWidget {
  const Under99({super.key});

  @override
  State<Under99> createState() => _Under99State();
}

class _Under99State extends State<Under99> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 0, 7),
          child: Text(
            "Under99",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            itemCount: under99images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: const Color.fromARGB(255, 255, 110, 64),
                    height: 200,

                    child: FoodcontainerBase(
                      imagePath: under99images[index],

                      foodName: under99Names[index],
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
