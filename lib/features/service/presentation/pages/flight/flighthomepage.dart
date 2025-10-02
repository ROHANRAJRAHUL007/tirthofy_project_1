import 'package:flutter/material.dart';

import 'package:tirthofy_code_1/features/service/presentation/pages/flight/flighthomepageui.dart';

class Flighthomepage extends StatefulWidget {
  const Flighthomepage({Key? key}) : super(key: key);

  @override
  _FlighthomepageState createState() => _FlighthomepageState();
}

class _FlighthomepageState extends State<Flighthomepage> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  title: const Text("Hotel Destinations"),
        //  centerTitle: true,
      ),

      body: FlighthomepageUI(),
    );
  }
}
