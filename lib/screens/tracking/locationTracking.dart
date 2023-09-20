import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/screens/tracking/delivery_status.dart';
import 'package:foodui/screens/tracking/delivery_status.dart';
import 'package:foodui/screens/tracking/delivery_status.dart';
import 'package:foodui/screens/tracking/delivery_status.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../const/constant.dart';

class DeliveryStatus extends StatefulWidget {
  static const routeName = "/myMaps";

  const DeliveryStatus({super.key});

  @override
  State<DeliveryStatus> createState() => _MyMapsState();
}

class _MyMapsState extends State<DeliveryStatus> {
   Completer<GoogleMapController> mapController = Completer();
  var logger = Logger();

  //Google map var's
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

  //slidingup panel var's
   final double _initFabHeight = 120.0;
   double _fabHeight = 0;
   double _panelHeightOpen = 0;
   double _panelHeightClosed = 75.0;

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
            zoom: 15.5)));
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
            "assets/images/virtual/deliver_boy.png")
        .then((icon) {
      currentIcon = icon;
    });
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[200],
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor : Colors.black,
    ));
    _fabHeight = _initFabHeight;
    getCurrentLocation();
    setcustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    _panelHeightOpen = MediaQuery.of(context).size.height * .70;
    return Scaffold(
      body: Material(
        child: Stack(
            alignment: Alignment.topCenter,
            children:[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              // _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
              //     _initFabHeight;
            }),
          ),
              Positioned(
                top: 35,
                  left: 20,
                  child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 13, 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                        color: AppColor.placeholder
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ))
        ]),
      )
    );

  }
   Widget _panel(ScrollController sc) {
     return MediaQuery.removePadding(
         context: context,
         removeTop: true,
         child: ListView(
           controller: sc,
           children: <Widget>[
             SizedBox(
               height: 12.0,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Container(
                   width: 30,
                   height: 5,
                   decoration: BoxDecoration(
                       color: Colors.grey[300],
                       borderRadius: BorderRadius.all(Radius.circular(12.0))),
                 ),
               ],
             ),

          Container(
             padding: EdgeInsets.only(left: 10,right: 10,top: 10),
       child: Column(
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Arriving in 20 mins",style: TextStyle(
                       fontSize: 18.sp,
                       fontWeight: FontWeight.bold,
                       color: Colors.black87),),
                  SizedBox(
                    width: 300.w,
                    child: RichText(text: TextSpan(
                        text: "Address : ",
                        style: TextStyle(
                    fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                        children: [TextSpan(
                            text: "B 8, Block B, Industrial Area, Sector 62, Noida, Uttar Pradesh 201309",
                        style: TextStyle(
                    fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87)
                        )])),
                  )
                 ],
               ),
             ],
           ),SizedBox(height: 25,),
           Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [SizedBox(width: 10,),
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("User Details : " ,
                         style: TextStyle(
                             fontSize: 15.sp,
                             fontWeight: FontWeight.w600,
                             color: Colors.black87)
                     ),
                   ),Padding(
                     padding: const EdgeInsets.only(left: 15),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Contact : " ,
                             style: TextStyle(
                                 fontSize: 13.sp,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black87)
                         ),
                         Text("+91-8168673754" ,
                             style: TextStyle(
                                 fontSize: 13.sp,
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black87)
                         )
                         // ,Text("Address : " ,
                         //     style: TextStyle(
                         //         fontSize: 13.sp,
                         //         fontWeight: FontWeight.w600,
                         //         color: Colors.black87)
                         // ),Container(
                         //   width: 310.w,
                         //   child: Text("B 8, Block B, Industrial Area, Sector 62, Noida, Uttar Pradesh 201309" ,
                         //       style: TextStyle(
                         //           fontSize: 13.sp,
                         //           fontWeight: FontWeight.normal,
                         //           color: Colors.black87)
                         //   ),
                         // )
                       ],
                     ),
                   )
                   ,
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Restaurant Details : " ,
                         style: TextStyle(
                             fontSize: 15.sp,
                             fontWeight: FontWeight.w600,
                             color: Colors.black87)
                     ),
                   ), Padding(
                     padding: const EdgeInsets.only(left:15),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,

                       children: [
                         Text("Name : " ,
                             style: TextStyle(
                                 fontSize: 13.sp,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black87)
                         ),
                         Text("Moradabad Food Court : " ,
                             style: TextStyle(
                                 fontSize: 13.sp,
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black87)
                         ),
                         Text("Contact : " ,
                             style: TextStyle(
                                 fontSize: 13.sp,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black87)
                         ), Text("+91-8168673754" ,
                             style: TextStyle(
                                 fontSize: 13.sp,
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black87)
                         ),  Text("Address : " ,
                             style: TextStyle(
                                 fontSize: 13.sp,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black87)
                         ),  Container(
                           width: 310.w,
                           child: Text("B 8, Block B, Industrial Area, Sector 62, Noida, Uttar Pradesh 201309" ,
                               style: TextStyle(
                                   fontSize: 13.sp,
                                   fontWeight: FontWeight.normal,
                                   color: Colors.black87)
                           ),
                         ),
                       ],
                     ),
                   ),



                 ],),

             ],
           ),
         ],
       ),
     ),

           ]
         ));
   }
   Widget _body() {
     return  currentLocation == null
         ? Center(child: Column(
       mainAxisSize: MainAxisSize.min,
       children: [
         CircularProgressIndicator(),
         SizedBox(height: 5,),
         Text("Loading Maps...")
       ],
     )) :
       GoogleMap(
       compassEnabled: false,
       zoomControlsEnabled: false,
       zoomGesturesEnabled: true,
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
     );

   }

  @override
  void dispose() {
    // TODO: implement dispose
    mapController = Completer();
    super.dispose();
  }
}
