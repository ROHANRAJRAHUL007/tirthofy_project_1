import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/holiday_packages/models/destination_models.dart';

class BestDestinations extends StatelessWidget {
  final List<Destination> bestDestinations;

  const BestDestinations({Key? key, required this.bestDestinations})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Best Selling Destinations",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text("Top trending Holiday Packages!"),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bestDestinations.length,
            itemBuilder: (context, index) {
              var dest = bestDestinations[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        dest.image,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(dest.name),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
