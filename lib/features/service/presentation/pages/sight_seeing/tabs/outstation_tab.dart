import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/sight_seeing/widgets/custom_field_text.dart';

import '../widgets/date_time_picker.dart';
import '../widgets/search_button.dart';

class OutstationTab extends StatefulWidget {
  const OutstationTab({super.key});

  @override
  State<OutstationTab> createState() => _OutstationTabState();
}

class _OutstationTabState extends State<OutstationTab> {
  bool isOneWay = true;

  final TextEditingController fromController = TextEditingController();
  final TextEditingController stop1Controller = TextEditingController();
  final TextEditingController stop2Controller = TextEditingController();
  final TextEditingController toController = TextEditingController();

  DateTime? tripStart;
  DateTime? tripEnd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: ChoiceChip(
                  label: const Text("One Way"),
                  selected: isOneWay,
                  onSelected: (_) => setState(() => isOneWay = true),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ChoiceChip(
                  label: const Text("Round Trip"),
                  selected: !isOneWay,
                  onSelected: (_) => setState(() => isOneWay = false),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(label: "From", controller: fromController),
          const SizedBox(height: 10),
          CustomTextField(label: "Stop 1", controller: stop1Controller),
          const SizedBox(height: 10),
          CustomTextField(label: "Stop 2", controller: stop2Controller),
          const SizedBox(height: 10),
          CustomTextField(label: "To", controller: toController),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DateTimePicker(
                  label: "Trip Start",
                  value: tripStart,
                  onPicked: (d) => setState(() => tripStart = d),
                ),
              ),
              const SizedBox(width: 10),
              if (!isOneWay)
                Expanded(
                  child: DateTimePicker(
                    label: "Trip End",
                    value: tripEnd,
                    onPicked: (d) => setState(() => tripEnd = d),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 30),
          SearchButton(
            onPressed: () {
              debugPrint(
                "Outstation => ${fromController.text} to ${toController.text}",
              );
            },
          ),
        ],
      ),
    );
  }
}
