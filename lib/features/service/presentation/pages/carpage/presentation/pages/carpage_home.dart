import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/widgets/bottomsheet.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/widgets/map_marker.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/widgets/mapwidget.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/widgets/mapzoombutton.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/widgets/topsearchbar.dart';

import 'package:tirthofy_code_1/features/service/presentation/pages/carpage/presentation/widgets/map_polylines.dart';

class Carpage extends StatefulWidget {
  const Carpage({super.key});

  @override
  State<Carpage> createState() => _CarpageState();
}

class _CarpageState extends State<Carpage> {
  LatLng myCurrentLocation = const LatLng(13.0108, 74.7943);

  Future<void> _checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
  }

  final Completer<GoogleMapController> _controller = Completer();

  List<LatLng> myPoints = [
    const LatLng(13.0108, 74.7943),
    const LatLng(13.009927262826073, 74.7886293423283),
  ];

  late Set<Marker> myMarker;
  late Set<Polyline> myPolyline;

  @override
  void initState() {
    super.initState();
    _checkPermission();
    myMarker = MapMarkers.getMarkers(myPoints);
    myPolyline = MapPolylines.getPolylines(myPoints);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // map
            MapWidget(myCurrentLocation: myCurrentLocation, myPoints: myPoints),

            /// 🔹 Top Search Bar + Back + Country
            Topsearchbar(),
          ],
        ),
        //zoom button of map
        floatingActionButton: Mapzoombutton(controller: _controller),
        //bottomsheet
        bottomSheet: Bottomsheet(),
      ),
    );
  }
}
