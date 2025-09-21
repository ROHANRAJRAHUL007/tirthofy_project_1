import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/core/theme.dart/theme_provider.dart';
//import 'package:tirthofy_code_1/features/home/presentation/pages/forget_password.dart';
import 'package:tirthofy_code_1/features/home/presentation/pages/homepage.dart';
//import 'package:tirthofy_code_1/features/home/presentation/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.lightTheme,
      color: Colors.deepOrange,

      //
      home: Homepage(),
    );
  }
}
