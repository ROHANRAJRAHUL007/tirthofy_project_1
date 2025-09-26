import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/allpagesdonation.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/donation_images.dart';

class Donationpage extends StatefulWidget {
  const Donationpage({super.key});

  @override
  State<Donationpage> createState() => _DonationpageState();
}

class _DonationpageState extends State<Donationpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donation", textAlign: TextAlign.center),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: donationimages.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // 👇 Do something when clicked
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Clicked on image #$index")),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => donationallpages[index],
                    ),
                  );
                },
                child: ClipOval(
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      donationimages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
