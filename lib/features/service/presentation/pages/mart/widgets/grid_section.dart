import 'package:flutter/material.dart';
import 'grid_item.dart';

class GridSection extends StatelessWidget {
  const GridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 2.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: const [
          GridItem(title: "M Mart", color: Color(0xFFD0F0C0)),
          GridItem(title: "Coco Mart", color: Color(0xFFFFF6A3)),
          GridItem(title: "GrabMart Kilat Nivea", color: Color(0xFFFFC0CB)),
          GridItem(title: "Self-Care Essentials", color: Color(0xFFADD8E6)),
        ],
      ),
    );
  }
}
