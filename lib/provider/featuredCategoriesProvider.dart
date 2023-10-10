import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../const/firebase.dart';
import '../modals/categories/FoodCategoriesListing.dart';
import '../modals/featured/featuredFoodCategories.dart';
import '../modals/foods/FoodCategoriesListing.dart' as foodCatListing;
import '../modals/foods/food.dart';
import '../modals/restaurants/RestaurantCategoriesByFoodItem.dart' as resCatFoodItem;
import '../utils/api_provider.dart';
import 'package:foodui/modals/restaurants/RestaurantListingByCategories.dart' as resCat;

class FeaturedCategoriesProvider extends ChangeNotifier {

  APIProvider apiProvider = APIProvider();
  List<resCatFoodItem.Data> foodCategoriesListing = [];
  List<foodCatListing.Data> foodItemsListing = [];
  List<resCat.Data> PopularRestaurantCategories = [];

 getMainFoodCategories()async{
   foodCategoriesListing =[];
   Response response = await apiProvider.get(
       url: "/restaurant_category.php");
   if(response.data['status'] ==true){
     successToast(response.data['message']);
     foodCategoriesListing = resCatFoodItem.RestaurantCategoriesByFoodItem.fromJson(response.data).data!;
     notifyListeners();
   }else{
     warningToast("Something went wrong");
   }
 }
  getSpecialFoodCategories()async{
    foodItemsListing = [];
    Response response = await apiProvider.get(
        url: "/food_category.php");
    if(response.data['status'] ==true){
      successToast(response.data['message']);
      foodItemsListing= foodCatListing.FoodCategoriesListing.fromJson(response.data).data!;
      notifyListeners();
    }else{
      warningToast("Something went wrong");
    }
  }

  getTopRestaurant() async {
    Response response = await apiProvider.get(
      url: "/get_top_restaurant.php",
    );
    if (response.data['status'] == true && response.data['data'] != null ) {
      successToast(response.data['message']);
      PopularRestaurantCategories = resCat.RestaurantListingByCategories.fromJson(response.data).data!;
      notifyListeners();
    }
  }

}
