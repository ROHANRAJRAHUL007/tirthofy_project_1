import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/home_stay_app/widgets/helper.dart';

class BookingCard extends StatefulWidget {
  const BookingCard({super.key});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  String selectedPurpose = 'Work';

  DateTime? checkInDate;
  DateTime? checkOutDate;
  int guests = 1;

  Future<void> _selectCheckIn() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        checkInDate = picked;
        if (checkOutDate != null && checkOutDate!.isBefore(checkInDate!)) {
          checkOutDate = null; // reset if check-out < check-in
        }
      });
    }
  }

  Future<void> _selectCheckOut() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: checkInDate ?? DateTime.now(),
      firstDate: checkInDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => checkOutDate = picked);
    }
  }

  Future<void> _selectGuests() async {
    int tempGuests = guests;
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Select Guests"),
        content: StatefulBuilder(
          builder: (context, setStateDialog) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (tempGuests > 1) {
                      setStateDialog(() => tempGuests--);
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text("$tempGuests", style: const TextStyle(fontSize: 18)),
                IconButton(
                  onPressed: () {
                    setStateDialog(() => tempGuests++);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() => guests = tempGuests);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -30),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              textField(Icons.search, 'Bangalore', 'India'),

              const Divider(),

              // ✅ Check-in & Check-out
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _selectCheckIn,
                      child: infoField(
                        Icons.calendar_today,
                        'CHECK-IN',
                        checkInDate == null
                            ? 'Select Date'
                            : "${checkInDate!.day}/${checkInDate!.month}/${checkInDate!.year}",
                      ),
                    ),
                  ),
                  Container(width: 1, height: 40, color: Colors.grey[300]),
                  Expanded(
                    child: GestureDetector(
                      onTap: _selectCheckOut,
                      child: infoField(
                        Icons.calendar_today_outlined,
                        'CHECK-OUT',
                        checkOutDate == null
                            ? 'Select Date'
                            : "${checkOutDate!.day}/${checkOutDate!.month}/${checkOutDate!.year}",
                      ),
                    ),
                  ),
                ],
              ),

              const Divider(),

              // ✅ Guests selector
              GestureDetector(
                onTap: _selectGuests,
                child: infoField(
                  Icons.person_outline,
                  'GUESTS',
                  "$guests Guest(s)",
                ),
              ),

              const SizedBox(height: 20),

              purposeButtons(
                selectedPurpose,
                (p) => setState(() => selectedPurpose = p),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  debugPrint(
                    "Search pressed: "
                    "Check-in=$checkInDate, Check-out=$checkOutDate, Guests=$guests, Purpose=$selectedPurpose",
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'SEARCH',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
