import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/sight_seeing/widgets/custom_field_text.dart';

import '../widgets/date_time_picker.dart';
import '../widgets/package_selector.dart';
import '../widgets/search_button.dart';

class HourlyTab extends StatefulWidget {
  const HourlyTab({super.key});

  @override
  State<HourlyTab> createState() => _HourlyTabState();
}

class _HourlyTabState extends State<HourlyTab> {
  final TextEditingController pickupController = TextEditingController();
  DateTime? tripStart;
  String selectedPackage = "1 Hr 10 Kms";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          CustomTextField(
            label: "Pick up address",
            controller: pickupController,
          ),
          const SizedBox(height: 16),
          DateTimePicker(
            label: "Trip Start",
            value: tripStart,
            onPicked: (d) => setState(() => tripStart = d),
          ),
          const SizedBox(height: 16),
          PackageSelector(
            selected: selectedPackage,
            onChanged: (val) => setState(() => selectedPackage = val),
          ),
          const SizedBox(height: 30),
          SearchButton(
            onPressed: () {
              debugPrint(
                "Hourly => Pickup: ${pickupController.text}, Package: $selectedPackage",
              );
            },
          ),
        ],
      ),
    );
  }
}
