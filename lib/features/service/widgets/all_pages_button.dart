import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/hotel_home_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/pages/carpage_home.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/home_page_main_file/food_home_page.dart';
//import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/pages/carpage_home.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/donationpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/gift/giftpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/pujapage/pujapage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/bike/bike_home_page.dart';
//import 'package:tirthofy_code_1/features/service/presentation/pages/food/veganpage.dart';

final List<Widget> pages = [
  const HotelHomePage(), // index 0
  const Foodpage(), // index 1
  const Giftpage(), // index 2
  const Carpage(), // index 3
  const BikeHomePage(), // index 4
  const Donationpage(), // index 5
  const Pujapage(), // index 6
  //  const Veganpage(), // index 7
];

final List<Widget> morepages = [
  //const HotelListPage(destId: destId, city: city), // index 0
  const Foodpage(), // index 1
  const Giftpage(), // index 2
  const Carpage(), // index 3
  const BikeHomePage(), // index 4
  const Donationpage(), // index 5
  const Pujapage(), // index 6
  // const Veganpage(), // index 7
];
