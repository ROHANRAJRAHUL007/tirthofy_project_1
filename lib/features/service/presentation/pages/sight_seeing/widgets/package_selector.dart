import 'package:flutter/material.dart';

class PackageSelector extends StatelessWidget {
  final String selected;
  final Function(String) onChanged;

  const PackageSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Package",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: selected,
          items: const [
            DropdownMenuItem(value: "1 Hr 10 Kms", child: Text("1 Hr 10 Kms")),
            DropdownMenuItem(
              value: "2 Hrs 20 Kms",
              child: Text("2 Hrs 20 Kms"),
            ),
            DropdownMenuItem(
              value: "4 Hrs 40 Kms",
              child: Text("4 Hrs 40 Kms"),
            ),
          ],
          onChanged: (val) => onChanged(val!),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }
}
