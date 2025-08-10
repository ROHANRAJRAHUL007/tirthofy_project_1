import 'package:flutter/material.dart';

class CandlePage extends StatefulWidget {
  const CandlePage({super.key});

  @override
  State<CandlePage> createState() => _CandlePageState();
}

class _CandlePageState extends State<CandlePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      //
      color: const Color.fromARGB(255, 242, 255, 1),
    );
  }
}
