// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// //import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:tirthofy_code_1/features/home/presentation/pages/assistent_methods.dart';
// import 'package:tirthofy_code_1/features/home/presentation/pages/homepage.dart';
// import 'package:tirthofy_code_1/features/home/presentation/pages/log_in.dart';
// import 'package:tirthofy_code_1/features/service/widgets/global.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   startTimer() {
//     Timer(Duration(seconds: 3), () async {
//       if (await FirebaseAuth.instance.currentUser != null) {
//         firebaseAuth.currentUser != null
//             ? AssistentMethods.readCurrentOnLineUserInfo()
//             : null;
//         Navigator.push(context, MaterialPageRoute(builder: (c) => Homepage()));
//       } else {
//         Navigator.push(context, MaterialPageRoute(builder: (c) => LogIn()));
//       }
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     startTimer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child:
//             //
//             Text(
//               "Tirthofy",
//               style: TextStyle(
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'AnandaNamaste',
//               ),
//             ),
//       ),
//     );
//   }
// }
