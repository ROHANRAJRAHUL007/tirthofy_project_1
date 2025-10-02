import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTile extends StatelessWidget {
  final DateTime? date;
  final bool isSelected;
  final VoidCallback onTap;

  const DateTile({
    Key? key,
    this.date,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  String _formatDay(DateTime date) {
    return DateFormat('EEE').format(date);
  }

  String _formatFullDate(DateTime date) {
    return DateFormat('d MMM, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.blue : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date != null ? _formatDay(date!) : "Select date",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ),
            Text(
              date != null ? _formatFullDate(date!) : "",
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.blue : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
