import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/pages/hotelhomepageui.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/pages/hotellist_page.dart';

class HotelHomePage extends StatefulWidget {
  const HotelHomePage({Key? key}) : super(key: key);

  @override
  _HotelHomePageState createState() => _HotelHomePageState();
}

class _HotelHomePageState extends State<HotelHomePage> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  title: const Text("Hotel Destinations"),
        //  centerTitle: true,
      ),

      body: Hotelhomepageui(),
    );
  }
}
