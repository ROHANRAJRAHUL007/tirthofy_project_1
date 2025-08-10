import 'package:flutter/material.dart';

class GiftPage extends StatefulWidget {
  const GiftPage({super.key});

  @override
  State<GiftPage> createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      //
      color: const Color.fromARGB(255, 113, 219, 1),
    );
  }
}
