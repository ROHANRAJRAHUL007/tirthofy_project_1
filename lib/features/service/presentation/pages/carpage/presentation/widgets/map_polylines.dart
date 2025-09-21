import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPolylines {
  static Set<Polyline> getPolylines(List<LatLng> points) {
    final Set<Polyline> polylines = {
      Polyline(
        polylineId: const PolylineId('first'),
        points: points,
        color: const Color.fromARGB(255, 167, 0, 0),
        width: 5,
      ),
    };
    return polylines;
  }
}
