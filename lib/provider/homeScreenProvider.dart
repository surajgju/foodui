
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';

import '../modals/categories/BannersMain.dart' as banners;
import '../utils/api_provider.dart';
import '../utils/snackbar.dart';

class HomeScreenProvider extends ChangeNotifier{
  LocationData? currentLocation;
  static const intialLocation = LatLng(28.6236, 77.3666);
  List<geo.Placemark>? placemarks;

  List<banners.Data> mainBannersList = [];
  APIProvider apiProvider = APIProvider();

  getCurrentAddress()async{
  print("called ....");
  var logger = Logger();
  try {
    Location location = Location();
    location.getLocation().then((location) async {
      currentLocation = location;
      if (location != null) {
        placemarks = await geo.placemarkFromCoordinates(
            location!.latitude!, location!.longitude!);
       // logger.i(placemarks.toString());
        notifyListeners();
      }
    });
  }catch(err){
    logger.e(err);
  }
}

  getMainBanners()async{
    mainBannersList =[];
    Response response = await apiProvider.get(
        url: "/banner");
    if(response.data['status'] ==true){
      successToast(response.data['message']);
      mainBannersList = banners.BannersMain.fromJson(response.data).data!;
      notifyListeners();
    }else{
      warningToast("Something went wrong");
    }
  }

}