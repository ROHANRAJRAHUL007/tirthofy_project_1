import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Mapzoombutton extends StatefulWidget {
  final Completer<GoogleMapController> controller;

  const Mapzoombutton({super.key, required this.controller});

  @override
  State<Mapzoombutton> createState() => _MapzoombuttonState();
}

class _MapzoombuttonState extends State<Mapzoombutton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        GoogleMapController mapController = await widget.controller.future;
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            const CameraPosition(target: LatLng(13.0108, 74.7943), zoom: 18),
          ),
        );
      },
      child: const Icon(Icons.location_searching),
    );
  }
}
