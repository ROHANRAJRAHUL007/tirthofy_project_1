import 'package:flutter/material.dart';

class Hotelhomepagead extends StatefulWidget {
  const Hotelhomepagead({super.key});

  @override
  State<Hotelhomepagead> createState() => _HotelhomepageadState();
}

class _HotelhomepageadState extends State<Hotelhomepagead> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: const Color.fromARGB(255, 255, 110, 64),
              height: 400,

              width: double.infinity,
              child: Image.asset(
                "assets/images/hotel_images/hotel_vector.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
