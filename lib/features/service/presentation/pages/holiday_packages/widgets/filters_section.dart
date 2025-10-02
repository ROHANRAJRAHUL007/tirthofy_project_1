import 'package:flutter/material.dart';

class FiltersSection extends StatelessWidget {
  const FiltersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        FilterChip(label: const Text("All Filters"), onSelected: (_) {}),
        FilterChip(label: const Text("Duration"), onSelected: (_) {}),
        FilterChip(label: const Text("Flights"), onSelected: (_) {}),
        FilterChip(label: const Text("Budget"), onSelected: (_) {}),
      ],
    );
  }
}
