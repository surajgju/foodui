
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart' as permissionHandler;
import '../modals/categories/BannersMain.dart' as banners;
import '../utils/api_provider.dart';
import '../utils/snackbar.dart';

class HomeScreenProvider extends ChangeNotifier{
  LocationData? currentLocation;
  static const intialLocation = LatLng(28.6236, 77.3666);
  List<geo.Placemark>? placemarks;

  List<banners.Data> mainBannersList = [];
  APIProvider apiProvider = APIProvider();
  Location location = Location();
  getCurrentAddress()async{
  var logger = Logger();
  try {


    final status = await permissionHandler.Permission.location.status;
    if(status.isGranted){
      location.changeSettings(accuracy: LocationAccuracy.high);
    location.getLocation().then((location) async {
      currentLocation = location;
      if (location != null) {
        placemarks = await geo.placemarkFromCoordinates(
            location!.latitude!, location!.longitude!);
        notifyListeners();
      }
    });}else if(status.isDenied) {
      Map<permissionHandler.Permission, permissionHandler.PermissionStatus> status =
      await [permissionHandler.Permission.location].request();
      if (await permissionHandler.Permission.location.isGranted) {
        location.changeSettings(accuracy: LocationAccuracy.high);
        location.getLocation().then((location) async {
          currentLocation = location;
          if (location != null) {
            placemarks = await geo.placemarkFromCoordinates(
                location!.latitude!, location!.longitude!);
            notifyListeners();
          }
        });
      }else if(await permissionHandler.Permission.location.isPermanentlyDenied){
        permissionHandler.openAppSettings();
      }
    }
  }catch(err){
    logger.e(err);
  }
}

  getMainBanners()async{
    mainBannersList =[];
    Response response = await apiProvider.get(
        url: "/banner");
    if(response.data['status'] ==true){
     // successToast(response.data['message']);
      mainBannersList = banners.BannersMain.fromJson(response.data).data!;
      notifyListeners();
    }else{
      warningToast("Something went wrong");
    }
  }

}