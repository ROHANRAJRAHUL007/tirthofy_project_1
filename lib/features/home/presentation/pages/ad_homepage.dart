import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/home/presentation/widget/ad_image_homepage.dart';

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
          itemCount: imagesAdHomepage.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: const Color.fromARGB(255, 255, 110, 64),
                  height: 200,
                  width: 100,
                  child: Image.asset(
                    imagesAdHomepage[index],
                    //
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
