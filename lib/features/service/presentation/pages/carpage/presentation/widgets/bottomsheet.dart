import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/pages/newsearchpage.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({super.key});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      //  color: Colors.deepOrangeAccent,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.vertical(
          //
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          //Greeting
          Padding(padding: EdgeInsetsGeometry.all(10)),
          Text("!! Welcome !!"),
          SizedBox(height: 12),

          //TO bar
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0.3, 25, 0),
            child: TextField(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewSearchPage()),
                );
              },
              readOnly: true,

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "From where?",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.lock_clock),
                filled: true,
                fillColor: const Color.fromARGB(255, 253, 239, 220),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0.3, 25, 0),
            child: TextField(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewSearchPage()),
                );
              },
              readOnly: true,

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Where to go?",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.lock_clock),
                filled: true,
                fillColor: const Color.fromARGB(255, 253, 239, 220),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text("Add pickup details(e.g. near the gate )"),
          //Elevated button
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            //child: Text('Choose this location '),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 115, 0),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            child: Text('Book Driver'),
          ),
        ],
      ),
    );
  }
}
