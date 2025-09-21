import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMarkers {
  static Set<Marker> getMarkers(List<LatLng> points) {
    final Set<Marker> markers = {};
    for (int a = 0; a < points.length; a++) {
      markers.add(
        Marker(
          markerId: MarkerId(a.toString()),
          position: points[a],
          infoWindow: const InfoWindow(
            title: 'Nitk place',
            snippet: '10 out of 10',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }
    return markers;
  }
}
