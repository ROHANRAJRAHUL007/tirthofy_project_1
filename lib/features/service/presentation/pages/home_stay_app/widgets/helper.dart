import 'package:flutter/material.dart';

Widget titleText(String title, {String? subtitle}) => Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      if (subtitle != null)
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
    ],
  ),
);

Widget textField(IconData icon, String hint, String label) => TextField(
  decoration: InputDecoration(
    prefixIcon: Icon(icon),
    hintText: hint,
    labelText: label,
    border: InputBorder.none,
  ),
);

Widget infoField(IconData? icon, String title, String subtitle) => Row(
  children: [
    if (icon != null) Icon(icon, color: Colors.grey),
    const SizedBox(width: 10),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        if (subtitle.isNotEmpty)
          Text(subtitle, style: const TextStyle(color: Colors.blue)),
      ],
    ),
  ],
);

Widget purposeButtons(String selectedPurpose, Function(String) onSelect) {
  final purposes = ['Work', 'Holiday', 'Others'];
  return Row(
    children: purposes.map((p) {
      final selected = selectedPurpose == p;
      return Expanded(
        child: GestureDetector(
          onTap: () => onSelect(p),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: selected ? Colors.blue[50] : null,
              border: Border.all(
                color: selected ? Colors.blue : Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                p,
                style: TextStyle(
                  color: selected ? Colors.blue : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList(),
  );
}
