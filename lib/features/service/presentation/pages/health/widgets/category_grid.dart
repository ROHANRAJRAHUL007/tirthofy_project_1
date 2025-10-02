import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "See All",
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              CategoryItem(
                imagePath: "assets/images/cough.png",
                title: "Cough & cold",
              ),
              CategoryItem(
                imagePath: "assets/images/pain.png",
                title: "Pain relievers",
              ),
              CategoryItem(
                imagePath: "assets/images/vitamin.png",
                title: "Vitamin",
              ),
              CategoryItem(
                imagePath: "assets/images/allergy.png",
                title: "Allergy",
              ),
              CategoryItem(
                imagePath: "assets/images/antimicrobial.png",
                title: "Antimicrobial",
              ),
              CategoryItem(
                imagePath: "assets/images/digestive.png",
                title: "Digestive",
              ),
              CategoryItem(
                imagePath: "assets/images/anti_inflammation.png",
                title: "Anti-inflamation",
              ),
              CategoryItem(imagePath: "assets/images/ent.png", title: "ENT"),
            ],
          ),
        ),
      ],
    );
  }
}
