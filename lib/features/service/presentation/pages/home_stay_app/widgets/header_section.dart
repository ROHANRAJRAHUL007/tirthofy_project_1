import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/home_stay_app/widgets/helper.dart';
import '../models/stay.dart';
import 'stay_card.dart';

Widget headerSection(List<Stay> stays) => Container(
  color: Colors.white,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      titleText(
        '8000+ Apartments',
        subtitle: 'for a comfy stay with modern amenities',
      ),
      SizedBox(
        height: 280,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: stays.length,
          itemBuilder: (_, i) => StayCard(stay: stays[i]),
        ),
      ),
    ],
  ),
);
