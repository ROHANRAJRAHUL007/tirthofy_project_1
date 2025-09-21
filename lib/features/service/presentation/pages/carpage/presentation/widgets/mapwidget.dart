import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng myCurrentLocation;
  final List<LatLng> myPoints;

  const MapWidget({
    super.key,
    required this.myCurrentLocation,
    required this.myPoints,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> myMarker = {};
  final Set<Polyline> myPolyline = {};

  @override
  void initState() {
    super.initState();

    // Add markers
    for (int a = 0; a < widget.myPoints.length; a++) {
      myMarker.add(
        Marker(
          markerId: MarkerId(a.toString()),
          position: widget.myPoints[a],
          infoWindow: const InfoWindow(
            title: 'Nitk place',
            snippet: '10 out of 10',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }

    // Add polyline
    myPolyline.add(
      Polyline(
        polylineId: const PolylineId('first'),
        points: widget.myPoints,
        color: const Color.fromARGB(255, 167, 0, 0),
        width: 5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: myMarker,
      polylines: myPolyline,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      initialCameraPosition: CameraPosition(
        target: widget.myCurrentLocation,
        zoom: 7,
      ),
    );
  }
}
