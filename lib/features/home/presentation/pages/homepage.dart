import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/home/buttomnavigationbar/buttom_navigationbar_pages.dart';
import 'package:tirthofy_code_1/features/home/buttomnavigationbar/buttomnavigation_icon.dart';
import 'package:tirthofy_code_1/features/home/presentation/pages/ad_homepage.dart';
import 'package:tirthofy_code_1/features/home/presentation/widget/seachbox.dart';
import 'package:tirthofy_code_1/features/service/widgets/servicebutton.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedindex = 0;
  void _navigateButtombar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

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
      body: _selectedindex == 0
          ? Column(
              children: [
                appbarofapp(),

                SizedBox(height: 10),

                Servicebutton(),

                Expanded(child: AdHomepage()),
              ],
            )
          : bottomNavigationPage[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedindex,
        onTap: _navigateButtombar,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),

        items: bottomNavIcons,
      ),
    );
  }
}
