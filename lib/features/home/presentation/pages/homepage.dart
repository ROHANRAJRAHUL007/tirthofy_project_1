import 'package:flutter/material.dart';

import 'package:tirthofy_code_1/features/home/presentation/widget/ad_homepage.dart';
import 'package:tirthofy_code_1/features/home/presentation/widget/seachbox.dart';
import 'package:tirthofy_code_1/features/service/widgets/servicebutton.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tirthofy",
          style: TextStyle(
            fontFamily: 'AnandaNamaste',
            //
            fontSize: 30,
          ),
        ),
        centerTitle: true,

        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          appbarofapp(),
          //
          SizedBox(height: 10),

          Servicebutton(),

          Expanded(child: AdHomepage()),
        ],
      ),
    );
  }
}
