import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/home_stay_app/widgets/booking_cart.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/home_stay_app/widgets/customer_appbar.dart';
import '../models/stay.dart';

import '../widgets/header_section.dart';

class homepagehomestay extends StatelessWidget {
  const homepagehomestay({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Stay> stays = [
      Stay(
        'https://placehold.co/600x400/E0B5A6/fff?text=Resort',
        'Luxury Resort & Spa',
        'by Lohono Stays',
        'Loved by 1845 travellers',
      ),
      Stay(
        'https://placehold.co/600x400/FFFFFF/333?text=Villa',
        'Aura Corporate Suites',
        'Rooms & Apartments',
        'Loved by 2648 travellers',
      ),
      Stay(
        'https://placehold.co/600x400/A8D8EA/fff?text=Beach+House',
        'Seaside Getaway',
        'by Coastal Homes',
        'Loved by 3120 travellers',
      ),
    ];

    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Column(children: [headerSection(stays), const BookingCard()]),
      ),
    );
  }
}
