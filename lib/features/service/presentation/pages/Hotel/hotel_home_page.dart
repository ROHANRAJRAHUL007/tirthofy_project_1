import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/pages/hotellist_page.dart';

class HotelHomePage extends StatefulWidget {
  const HotelHomePage({Key? key}) : super(key: key);

  @override
  _HotelHomePageState createState() => _HotelHomePageState();
}

class _HotelHomePageState extends State<HotelHomePage> {
  bool loading = true;

  // // ✅ Dummy destinations list (replace with API later if needed)
  // List<Map<String, dynamic>> destinations = [];

  // @override
  // void initState() {
  //   super.initState();
  //   fetchDestinations();
  // }

  // Future<void> fetchDestinations() async {
  //   await Future.delayed(const Duration(seconds: 1)); // simulate API delay
  //   setState(() {
  //     destinations = [
  //       {"dest_id": "1063655", "label": "Kolkata", "region": "East"},
  //       {"dest_id": "1063656", "label": "Delhi", "region": "North"},
  //       {"dest_id": "1063657", "label": "Mumbai", "region": "West"},
  //       {"dest_id": "1063658", "label": "Bengaluru", "region": "South"},
  //     ];
  //     loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  title: const Text("Hotel Destinations"),
        //  centerTitle: true,
      ),

      body: HotelListPage(),
    );
  }
}
