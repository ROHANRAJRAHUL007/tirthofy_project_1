import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CategoryItem(title: "GrabMart Kilat", icon: Icons.timer),
          CategoryItem(title: "Near Me!", icon: Icons.location_on),
          CategoryItem(title: "Oleh-oleh Bali", icon: Icons.shopping_basket),
          CategoryItem(title: "Minimarket", icon: Icons.store),
        ],
      ),
    );
  }
}
