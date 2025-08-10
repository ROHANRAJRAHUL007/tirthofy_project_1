import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/appbarofapp.dart';
import 'package:tirthofy_code_1/serviceButton.dart';
//import 'package:tirthofy_code_1/service_option.dart';
//import 'package:tirthofy_code_1/service_option.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tirthofy")),
      body: Column(
        children: [
          appbarofapp(),
          //
          SizedBox(height: 10),
          // ServiceOption(),
          Servicebutton(),
          //   OptionServices(),
        ],
      ),
    );
  }
}
