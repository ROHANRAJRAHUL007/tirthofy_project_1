import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart ' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BikeHomePage extends StatefulWidget {
  const BikeHomePage({super.key});

  @override
  State<BikeHomePage> createState() => _BikeHomePageState();
}

class _BikeHomePageState extends State<BikeHomePage> {
  LatLng? pickLocation;
  loc.Location location = loc.Location();
  String? _address;

  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.3176, 82.9739),
    zoom: 14.47,
  );
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  double searchLocationContainerHeight = 200;
  double waitingResponefromDriverContainerHeight = 0;
  double assignedDriverInfoContainerHeight = 0;

  Position? userCurrentPosition;
  var geolocation = Geolocator();

  LocationPermission? _locationPermission;
  double bottomPaddingofMap = 0;

  List<LatLng> pLineCoordinatedList = [];
  Set<Polyline> polylineSet = {};

  Set<Marker> markerSet = {};
  Set<Circle> circleSet = {};

  String userName = "";
  String userEmail = "";

  bool openNavigationDrawer = true;
  bool activeNearbyDriverKeysLoaded = false;
  BitmapDescriptor? activeNearbyIcon;

  locateUserposition() async {
    Position cPosition = await Geolocator.getCurrentPosition();
    userCurrentPosition = cPosition;

    LatLng latlngPosition = LatLng(
      userCurrentPosition!.latitude,
      userCurrentPosition!.longitude,
    );
    newGoogleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: latlngPosition)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap
            //
            (
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              polylines: polylineSet,
              markers: markerSet,
              circles: circleSet,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller); // ✅ correct variable
                newGoogleMapController = controller;
                setState(() {});
                locateUserposition();
              },

              onCameraMove: (CameraPosition? position) {
                if (pickLocation != position!.target) {
                  setState(() {
                    pickLocation = position.target;
                  });
                }
              },
              onCameraIdle: () {
                // getAddressFromLatLng()
              },
            ),
          ],
        ),
      ),
    );
  }
}
