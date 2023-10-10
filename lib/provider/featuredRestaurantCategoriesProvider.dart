import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodui/modals/restaurants/RestaurantListingByCategories.dart' as resCat;
import '../const/firebase.dart';
import '../modals/featured/featuredRestaurantCategories.dart';
//import '../modals/restaurants/restaurant.dart';
import '../modals/restaurants/Restaurant.dart';
import '../modals/restaurants/RestaurantMenu.dart' as resMenu;
import '../modals/restaurants/RestaurantMenuItems.dart' as resMenuItems;
import '../utils/api_provider.dart';
import '../utils/snackbar.dart';

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
  Restaurant restaurant = Restaurant();
  List<resMenu.Data> restaurantMenu = [];
  List<resMenuItems.Data> restaurantMenuItems = [];
  Map<String,int> scrollItemMap = {};
  getRestaurantByCategories(String category) async {
    Response response = await apiProvider.get(
      url: "/get_restaurant_category_name.php?cat_name=$category",
    );
    if (response.data['status'] == true && response.data['data'] != null ) {
  //  restaurantCategories = [];
      successToast(response.data['message']);
      restaurantCategories = resCat.RestaurantListingByCategories.fromJson(response.data).data!;
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
      url: "/get_restaurant_product_name.php?product_name=$food_item",
    );
    if (response.data['status'] == true) {
      restaurantCategories = resCat.RestaurantListingByCategories.fromJson(response.data).data!;
      successToast(response.data['message']);
      notifyListeners();
    }
  }

  getRestaurantDetailById(restaurant_id)async{
    Response response = await apiProvider.get(
      url: "/vendor_store_by_id.php?vendor_id=$restaurant_id",
    );
    if (response.data['status'] == true) {
      restaurant = Restaurant.fromJson(response.data['data'][0]);
      notifyListeners();
      successToast(response.data['message']);
    }
  }
  getRestaurantMenuById(restaurant_id)async{
    restaurantMenu =[];
    Response response = await apiProvider.get(
      url: "/restaurant_menu_by_id.php?restaurant_id=$restaurant_id",
    );
    if (response.data['status'] == true) {
      resMenu.RestaurantMenu.fromJson(response.data).data!.forEach((e) {
        restaurantMenu.add(e);
      });
      notifyListeners();
      successToast(response.data['message']);
    }
  }
  getMenuItemByRestaurantId(restaurant_id)async{
    restaurantMenuItems =[];
    Response response = await apiProvider.get(
      url: "/get_restaurant_product_by_menu.php?restaurant_id=$restaurant_id",
    );
    if (response.data['status'] == true) {
      resMenuItems.RestaurantMenuItems.fromJson(response.data).data!.forEach((e) {
        restaurantMenuItems.add(e);
      });
      notifyListeners();
      successToast(response.data['message']);
      mapScrollIndex();
    }
  }
  getRestaurantByCategoriesForWidget(String category) async {
    Response response = await apiProvider.get(
      url: "/get_restaurant_category_name.php?cat_name=$category",
    );
    if (response.data['status'] == true && response.data['data'] != null ) {
      //  restaurantCategoriesForWidget = [];
      successToast(response.data['message']);
      restaurantCategoriesForWidget = resCat.RestaurantListingByCategories.fromJson(response.data).data!;
      notifyListeners();
    }
  }
  searchRestaurantByLocation() async {
    Response response = await apiProvider.get(
      url: "/restaurant_by_location.php?location=${searchString.text}",
    );
    if (response.data['status'] == true && response.data['data'] != null ) {
      successToast(response.data['message']);
      searchRestaurantByLocationList = resCat.RestaurantListingByCategories.fromJson(response.data).data!;
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

}
