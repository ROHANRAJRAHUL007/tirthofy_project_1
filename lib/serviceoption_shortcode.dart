import 'package:flutter/material.dart';

class OptionServices extends StatelessWidget {
  const OptionServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 columns
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: 8, // total number of boxes
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(251, 151, 0, 0.5), // with opacity
            ),
          );
        },
      ),
    );
  }
}
