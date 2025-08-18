// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Smallcarpage extends StatefulWidget {
  const Smallcarpage({super.key});

  @override
  State<Smallcarpage> createState() => _SmallcarpageState();
}

class _SmallcarpageState extends State<Smallcarpage> {
  LatLng myCurrentLocation = LatLng(13.0108, 74.7943);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: myCurrentLocation,
          zoom: 15,
        ),
      ),
    );
  }
}
