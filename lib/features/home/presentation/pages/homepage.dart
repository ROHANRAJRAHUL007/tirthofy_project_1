import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/home/presentation/widget/ad_homepage.dart';
import 'package:tirthofy_code_1/features/home/presentation/widget/seachbox.dart';
import 'package:tirthofy_code_1/features/service/widgets/serviceButton.dart';
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

          Servicebutton(),
          // SizedBox(height: 10),
          Expanded(child: AdHomepage()),
        ],
      ),
    );
  }
}
