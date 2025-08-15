import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double radius;
  final double iconSize;
  final VoidCallback? onTap;

  const CustomCircleAvatar({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color.fromARGB(255, 255, 115, 0),
    this.iconColor = Colors.black87,
    this.radius = 30,
    this.iconSize = 30,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: Icon(icon, size: iconSize, color: iconColor),
      ),
    );
  }
}
