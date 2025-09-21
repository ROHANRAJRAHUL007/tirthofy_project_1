import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/pages/newsearchpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/pages/religious_city.dart';

class Topsearchbar extends StatefulWidget {
  const Topsearchbar({super.key});

  @override
  State<Topsearchbar> createState() => _TopsearchbarState();
}

class _TopsearchbarState extends State<Topsearchbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          //back button
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          ),
          //seach button
          Expanded(
            child: TextField(
              readOnly: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewSearchPage()),
                );
              },
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                hintText: "where to go",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          //city button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white10,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReligiousCity()),
                  );
                },
                icon: Icon(Icons.temple_hindu, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
