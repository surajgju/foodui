import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import '../../const/constant.dart';

class MyMaps extends StatefulWidget {
  static const routeName = "/myMaps";

  const MyMaps({super.key});

  @override
  State<MyMaps> createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
   Completer<GoogleMapController> mapController = Completer();
  var logger = Logger();
  // static const intialLocation = LatLng(28.634510,77.388826);
  // static const destinationLocation = LatLng(28.631417,77.340880);
  static const intialLocation = LatLng(28.6236, 77.3666);
  static const destinationLocation = LatLng(28.5638, 77.3344);
  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
   LocationData? initLocation;


  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
      initLocation = location;
      setState(() {});
    });
    final  GoogleMapController googleMapController = await mapController.future;

    location.onLocationChanged.listen((newLoc) {

      try {
       // setState(() {
          googleMapController.animateCamera(CameraUpdate.newCameraPosition( CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(newLoc.latitude!, newLoc.longitude!),
            tilt: 59.440717697143555,
            zoom: 13.5)));
        // logger.i("$newLoc");
     //  });
      } catch (err) {
        logger.d("error in loading $err");
      }
    });
  }



  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(intialLocation.latitude, intialLocation.longitude),
       // PointLatLng(initLocation!.latitude!, initLocation!.longitude!),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
      setState(() {});
    }
  }

  setcustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/virtual/pin_source.png")
        .then((icon) {
      sourceIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
            "assets/images/virtual/pin_destination.png")
        .then((icon) {
      destinationIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
            "assets/images/virtual/pin_current_location.png")
        .then((icon) {
      currentIcon = icon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    setcustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Location"),
      ),
      body: currentLocation == null
          ? Text("Loading")
          : GoogleMap(
              initialCameraPosition: CameraPosition(

                target: LatLng(
                    currentLocation!.latitude!, currentLocation!.longitude!),
                zoom: 13.5,
              ),
              polylines: {
                Polyline(
                    polylineId: PolylineId("route"),
                    points: polylineCoordinates,
                    color: Colors.green,
                    width: 6)
              },
              markers: {
                Marker(
                    markerId: MarkerId("currentLocation"),
                    icon: currentIcon,
                    position: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!)),
                  Marker(
                    icon: sourceIcon!,
                    markerId: MarkerId("source"),
                    position: intialLocation),
                Marker(
                    icon: destinationIcon,
                    markerId: MarkerId("destination"),
                    position: destinationLocation)
              },
              onMapCreated: (localMapController) {
               // if (!mapController.isCompleted) {
                  mapController.complete(localMapController);
              //  }
              },
              //   myLocationButtonEnabled: true,
            ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mapController = Completer();
    super.dispose();
  }
}
