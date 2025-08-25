import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/newsearchpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/religious_city.dart';

class Carpage extends StatefulWidget {
  const Carpage({super.key});

  @override
  State<Carpage> createState() => _CarpageState();
}

class _CarpageState extends State<Carpage> {
  LatLng myCurrentLocation = LatLng(13.0108, 74.7943);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: myCurrentLocation,
              zoom: 15,
            ),
          ),

          /// 🔹 Top Search Bar + Back + Country
          SafeArea(
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
                        MaterialPageRoute(
                          builder: (context) => Newsearchpage(),
                        ),
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
                          MaterialPageRoute(
                            builder: (context) => ReligiousCity(),
                          ),
                        );
                      },
                      icon: Icon(Icons.temple_hindu, size: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      //bottomsheet
      bottomSheet: Container(
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
                    MaterialPageRoute(builder: (context) => Newsearchpage()),
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
                  fillColor: const Color.fromARGB(255, 244, 195, 128),
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
      ),
    );
  }
}
