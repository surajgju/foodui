import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qconnect/modals/restaurants/RestaurantListingByCategory.dart' as resCat;
import '../const/firebase.dart';
import '../modals/DistanceMatrixResponse.dart';
import '../modals/GeoCodeResponse.dart';
import '../modals/restaurants/RestaurantDetails.dart';
import '../modals/restaurants/RestaurantMenu.dart' as resMenu;
import '../modals/restaurants/RestaurantMenuItems.dart' as resMenuItems;
import '../utils/api_provider.dart';
import '../utils/snackbar.dart';
import 'package:location/location.dart' as LocationPack ;

class FeaturedRestaurantCategoriesProvider extends ChangeNotifier {

  bool isShortByEnable = false;
  bool isCuisinesEnable = false;
  bool isRatingEnable = false;
  bool isFreeDeliveryEnable = false;
  bool isUnderTenMinutesEnable = false;
  bool isNewlyAddedEnable = false;
  APIProvider apiProvider = APIProvider();
  List<resCat.Data> restaurantCategories = [];
  List<resCat.Data> restaurantCategoriesForWidget = [];
  List<resCat.Data> searchRestaurantByLocationList = [];
  TextEditingController searchString = TextEditingController();
  RestaurantDetails restaurant = RestaurantDetails();
  List<resMenu.Data> restaurantMenu = [];
  List<resMenuItems.Data> restaurantMenuItems = [];
  Map<String,int> scrollItemMap = {};
  DistanceMatrixResponse restaurantDistanceMatrix= DistanceMatrixResponse();
  getRestaurantByCategories(String category) async {
    Response response = await apiProvider.get(
      url: "/vendor-complete-details?vendor_id=$category",authToken: true
    );
    if (response.data['status'] == true && response.data['data'] != null ) {
     // successToast(response.data['message']);
      restaurantCategories = resCat.RestaurantListingByCategory.fromJson(response.data).data!;
      notifyListeners();
    }
  }
  // getRestaurantByLocation(String location) async {
  //   Response response = await apiProvider.get(
  //     url: "/get_restaurant_category_name.php?cat_name=$location",
  //   );
  //   if (response.data['status'] == true) {
  //     successToast(response.data['message']);
  //     notifyListeners();
  //   }
  // }
  getRestaurantByFoodItem(String food_item) async {
    Response response = await apiProvider.get(
      url: "/rest-product.html?product_name=$food_item",
    );
    if (response.data['status'] == true) {
      restaurantCategories = resCat.RestaurantListingByCategory.fromJson(response.data).data!;
     // successToast(response.data['message']);
      notifyListeners();
    }
  }

  getRestaurantDetailById(restaurant_id)async{
    restaurant = RestaurantDetails();
    Response response = await apiProvider.get(
      url: "/vendor-store-by-id.html?vendor_id=$restaurant_id",
    );
    if (response.data['status'] == true) {
      restaurant = RestaurantDetails.fromJson(response.data['data'][0]);
      notifyListeners();
     // successToast(response.data['message']);
      fetchDistanceMatrix(RestaurantDetails.fromJson(response.data['data'][0]));
    }

  }
  fetchDistanceMatrix(RestaurantDetails restaurantDetails)async{
    LocationPack.Location locObj = LocationPack.Location();
    var location =await  locObj!.getLocation();
    deliveryTimeCalculator(restaurantDetails.plusCode,location.latitude,location.longitude);
  }

  getRestaurantMenuById(restaurant_id)async{
    restaurantMenu =[];
    Response response = await apiProvider.get(
      url: "/rest-menu.html?restaurant_id=$restaurant_id",
    );
    if (response.data['status'] == true) {
      resMenu.RestaurantMenu.fromJson(response.data).data!.forEach((e) {
        restaurantMenu.add(e);
      });
      notifyListeners();
    //  successToast(response.data['message']);
    }
  }
  getMenuItemByRestaurantId(restaurant_id)async{
    restaurantMenuItems =[];
    Response response = await apiProvider.get(
      url: "/rest-product-menu.html?restaurant_id=$restaurant_id",authToken: true
    );
    if (response.data['status'] == true) {
      resMenuItems.RestaurantMenuItems.fromJson(response.data).data!.forEach((e) {
        restaurantMenuItems.add(e);
      });
      notifyListeners();
    //  successToast(response.data['message']);
      mapScrollIndex();
    }
  }
  getRestaurantByCategoriesForWidget(String category) async {
    restaurantCategoriesForWidget =[];
    Response response = await apiProvider.get(
      url: "/rest-cat-name.html?cat_name=$category",
    );
    if (response.data['status'] == true && response.data['data'] != null ) {
      //  restaurantCategoriesForWidget = [];
      //successToast(response.data['message']);
      restaurantCategoriesForWidget = resCat.RestaurantListingByCategory.fromJson(response.data).data!;
      notifyListeners();
    }
  }
  searchRestaurantByLocation() async {
    searchRestaurantByLocationList = [];
    Response response = await apiProvider.get(
      url: "/rest-location.html?location=${searchString.text}",authToken: true
    );
    if (response.data['status'] == true && response.data['data'] != null ) {
    //  successToast(response.data['message']);
      searchRestaurantByLocationList = resCat.RestaurantListingByCategory.fromJson(response.data).data!;
      notifyListeners();
    }
  }
  mapScrollIndex(){
    scrollItemMap = {};
    if(restaurantMenu.isNotEmpty && restaurantMenuItems.isNotEmpty ){
      for (var item in restaurantMenuItems) {
        var categoryId = item.categoryId;
        if (scrollItemMap.containsKey(categoryId)) {
          scrollItemMap[categoryId!] = scrollItemMap[categoryId]! + 1;
        } else {
          scrollItemMap[categoryId!] = 1;
        }
      }
    notifyListeners();
    }}
  
  Future<GeoCodeResponse> plusCodeConverter(geoCode)async{
    GeoCodeResponse geoCodeResponse = GeoCodeResponse();
    var data = await apiProvider.dio.request("https://maps.googleapis.com/maps/api/geocode/json?address=$geoCode&key=AIzaSyAb8I4_6GO8jtMYPKAbwSYFDTMoUnj359Q");
    geoCodeResponse = GeoCodeResponse.fromJson(data.data);
    return geoCodeResponse;
  }
  Future<DistanceMatrixResponse> restaurantDistanceCalculator(sourceLat,sourceLong,destinationLat,destinationLong)async{
    DistanceMatrixResponse distanceMatrixResponse = DistanceMatrixResponse();
    var data = await apiProvider.dio.request("https://maps.googleapis.com/maps/api/distancematrix/json?origins=$sourceLat,$sourceLong&destinations=$destinationLat,$destinationLong&key=AIzaSyAb8I4_6GO8jtMYPKAbwSYFDTMoUnj359Q");
    distanceMatrixResponse = DistanceMatrixResponse.fromJson(data.data);
    return distanceMatrixResponse;
  }

  deliveryTimeCalculator(geoCode,currentLat,currentLong)async{
    restaurantDistanceMatrix = DistanceMatrixResponse();
    GeoCodeResponse geoCodeResponse = await plusCodeConverter(geoCode);
    restaurantDistanceMatrix = await restaurantDistanceCalculator(geoCodeResponse.results![0].geometry!.location!.lat,geoCodeResponse.results![0].geometry!.location!.lng,currentLat,currentLong);
    notifyListeners();
  }

  calculatePrice(double distance){
    double extraDistance =  distance-5000;
    double extimatedCost = extraDistance/1000*6+25;
    return extimatedCost.round();
  }

}
