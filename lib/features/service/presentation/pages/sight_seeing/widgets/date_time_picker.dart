import 'package:flutter/material.dart';

class DateTimePicker extends StatelessWidget {
  final String label;
  final DateTime? value;
  final Function(DateTime) onPicked;

  const DateTimePicker({
    super.key,
    required this.label,
    required this.value,
    required this.onPicked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: value ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(value ?? DateTime.now()),
              );
              if (pickedTime != null) {
                onPicked(
                  DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  ),
                );
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 18, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  value != null
                      ? "${value!.day}/${value!.month}/${value!.year} - ${value!.hour}:${value!.minute.toString().padLeft(2, '0')}"
                      : "Select Date & Time",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
