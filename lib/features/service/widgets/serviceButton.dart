import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/widgets/all_pages_button.dart';

class Servicebutton extends StatefulWidget {
  const Servicebutton({super.key});

  @override
  State<Servicebutton> createState() => _ServicebuttonState();
}

class _ServicebuttonState extends State<Servicebutton> {
  // Labels for main grid
  final List<String> labels = [
    "Hotel",
    "Food",
    "Flight",
    "Car",
    "Bike",
    "Gift",
    "Health",
    "All",
  ];

  final List<String> images = [
    "assets/images/service_button_not_hd/hotel.png",
    "assets/images/service_button_not_hd/dineout.jpg",
    "assets/images/service_button_not_hd/flight.png",
    "assets/images/service_button_not_hd/car.png",
    "assets/images/service_button_not_hd/bike.png",
    "assets/images/service_button_not_hd/shight_seeing.png",
    "assets/images/service_button_not_hd/mart.png",
    "assets/images/service_button_not_hd/more.png",
  ];

  // Labels for bottom sheet grid
  final List<String> labelsBottomSheet = [
    "Service 1",
    "Service 2",
    "Service 3",
    "Service 4",
    "Service 5",
    "Service 6",
    "Service 7",
    "Service 8",
    "Service 9",
    "Service 10",
  ];

  // Image paths for bottom sheet grid
  final List<String> imagesBottomSheet = [
    "assets/images/service_button_not_hd/ride_later.png",
    "assets/images/service_button_not_hd/train.png",
    "assets/images/service_button_not_hd/holiday.png",
    "assets/images/service_button_not_hd/homestays.png",
    "assets/images/service_button_not_hd/donation.png",
    "assets/images/service_button_not_hd/insurance.png",
    "assets/images/service_button_not_hd/health.png",
    "assets/images/service_button_not_hd/pooja_booking.png",
    "assets/images/service_button_not_hd/gift.png",
    "assets/images/service_button_not_hd/blog.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.85,
        ),
        itemCount: labels.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              if (index == labels.length - 1) {
                // Open bottom sheet when "All" is clicked
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        const SizedBox(height: 12),
                        const Text(
                          "More options",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(20),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 25,
                                  crossAxisSpacing: 25,
                                  childAspectRatio: 0.85,
                                ),
                            itemCount: labelsBottomSheet.length,
                            itemBuilder: (BuildContext context, int moreIndex) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          morePages[moreIndex],
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF4F9F4),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        imagesBottomSheet[moreIndex],
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        labelsBottomSheet[moreIndex],
                                        style: const TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                // Normal item click
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF4F9F4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    images[index],
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    labels[index],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
