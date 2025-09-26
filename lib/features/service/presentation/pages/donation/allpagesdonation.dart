import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/badrinath.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/basno_devi.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/kashi.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/kedarnath.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/kolkata_madir.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/meenakshi.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/puri.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/ramanathaswamy.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/donation/somnath.dart';

final List<Widget> donationallpages = [
  const Badrinath(
    mandirName: "Badrinath",
    imagePath: "assets/images/donation_images/Badrinath_Temple.jpg",
  ),
  const BasnoDevi(
    mandirName: "Vaishno Devi",
    imagePath: "assets/images/donation_images/basno_devi.jpg",
  ),
  const Kashi(
    mandirName: "Kashi Vishwanath",
    imagePath: "assets/images/donation_images/kashi.jpg",
  ),
  const Kedarnath(
    mandirName: "Kedarnath",
    imagePath: "assets/images/donation_images/kedarnath.jpg",
  ),
  const KolkataMadir(
    mandirName: "Kalighat Temple",
    imagePath: "assets/images/donation_images/kolkata_mandir.jpg",
  ),
  const Meenakshi(
    mandirName: "Meenakshi Temple",
    imagePath: "assets/images/donation_images/meenakshi_temple.jpg",
  ),
  const Puri(
    mandirName: "Jagannath Puri",
    imagePath: "assets/images/donation_images/puri.jpg",
  ),
  const Ramanathaswamy(
    mandirName: "Ramanathaswamy Temple",
    imagePath: "assets/images/donation_images/Ramanathaswamy.jpg",
  ),
  const Somnath(
    mandirName: "Somnath",
    imagePath: "assets/images/donation_images/Somanath_Temple.jpg",
  ),
];
