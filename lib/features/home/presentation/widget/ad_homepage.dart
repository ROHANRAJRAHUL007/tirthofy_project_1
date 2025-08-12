import 'package:flutter/material.dart';

class AdHomepage extends StatefulWidget {
  const AdHomepage({super.key});

  @override
  State<AdHomepage> createState() => _AdHomepageState();
}

class _AdHomepageState extends State<AdHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                color: const Color.fromARGB(255, 255, 110, 64),
                height: 200,
                width: 100,
              ),
            );
          },
        ),
      ),
    );
  }
}
