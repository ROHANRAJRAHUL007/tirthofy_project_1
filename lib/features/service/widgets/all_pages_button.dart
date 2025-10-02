import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/Hotel/hotel_home_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/blogs/homepage/travel_home_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/bus_train/page/bus_search_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/pages/carpage_home.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/home_page_main_file/food_home_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/donationpage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/flight/flighthomepage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/gift/pages/gift_homepage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/health/homepage/health_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/home_stay_app/pages/homepage.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/bike/bike_home_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/insurance/insurance_home_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/mart/pages/mart_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/pujaa/pages/home_screen.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/ride_later/pages/flight_arrival_screen.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/sight_seeing/home/sight_seeing_homepage.dart';

final List<Widget> pages = [
  const HotelHomePage(), // index 0
  const Foodpage(), // index 1
  const Flighthomepage(), // index 2
  const Carpage(), // index 3
  const BikeHomePage(), // index 4
  const SightSeeingHomepage(), // index 5
  const MartPage(), // index 6
];

final List<Widget> morePages = [
  RideLater(), // index 1
  const BusSearchPage(), // index 3
  const homepagehomestay(), // index 4
  const homepagehomestay(), // index 5
  const Donationpage(),
  const TravelInsurancePage(), //index 6
  const HealthPage(), //index 7
  PoojaBookingScreen(), // index 8
  const GiftHomepage(), //index 9
  BlogHomePage(), // index 10
];
