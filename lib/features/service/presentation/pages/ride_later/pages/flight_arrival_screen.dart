import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/date_tile.dart';

class RideLater extends StatefulWidget {
  @override
  _RideLaterState createState() => _RideLaterState();
}

class _RideLaterState extends State<RideLater> {
  List<DateTime> dates = [];
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _generateDates();
  }

  void _generateDates() {
    DateTime now = DateTime.now();
    dates = List.generate(2, (index) => now.add(Duration(days: index)));
  }

  String _formatDate(DateTime date) {
    return DateFormat('EEE, d MMM yyyy').format(date);
  }

  Future<void> _selectCustomDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        if (!dates.contains(picked)) {
          dates.add(picked);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "When’s your flight arriving?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "If a flight delay happens, we’ll push back your pickup time.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Text(
              "Arrival date at destination",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            ...dates.map(
              (date) => DateTile(
                date: date,
                isSelected: selectedDate == date,
                onTap: () {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
            DateTile(
              date: null,
              isSelected: selectedDate == null,
              onTap: _selectCustomDate,
            ),
          ],
        ),
      ),
    );
  }
}
