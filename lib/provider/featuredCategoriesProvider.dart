import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:qconnect/utils/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../const/firebase.dart';
import '../modals/categories/FoodCategoriesListing.dart';
import '../modals/categories/FoodCategoriesMain.dart' as foodCatMain;
import '../modals/featured/featuredFoodCategories.dart';
import '../modals/foods/FoodCategoriesListing.dart' as foodCatListing;
import '../modals/foods/food.dart';
import '../modals/restaurants/RestaurantCategoriesByFoodItem.dart' as resCatFoodItem;
import '../utils/api_provider.dart';
import 'package:qconnect/modals/restaurants/RestaurantListingByCategory.dart' as resCat;

class FeaturedCategoriesProvider extends ChangeNotifier {

  APIProvider apiProvider = APIProvider();
  List<resCatFoodItem.Data> foodCategoriesListing = [];
  List<foodCatMain.Data> foodCategoriesMain = [];
  List<foodCatListing.Data> foodItemsListing = [];
  List<resCat.Data> PopularRestaurantCategories = [];

 getMainFoodCategories()async{
   foodCategoriesMain =[];
   Response response = await apiProvider.get(
       url: "/food-category-main");
   if(response.data['status'] ==true){
     // successToast(response.data['message']);
     foodCategoriesMain = foodCatMain.FoodCategoriesMain.fromJson(response.data).data!;
     notifyListeners();
   }else{
     warningToast("Something went wrong");
   }
 }
 // getMainFoodCategories()async{
 //   foodCategoriesListing =[];
 //   Response response = await apiProvider.get(
 //       url: "/rest-category.html");
 //   if(response.data['status'] ==true){
 //     successToast(response.data['message']);
 //     foodCategoriesListing = resCatFoodItem.RestaurantCategoriesByFoodItem.fromJson(response.data).data!;
 //     notifyListeners();
 //   }else{
 //     warningToast("Something went wrong");
 //   }
 // }
  getSpecialFoodCategories()async{
    foodItemsListing = [];
    Response response = await apiProvider.get(
        url: "/food-category.html");
    if(response.data['status'] ==true){
    //  successToast(response.data['message']);
      foodItemsListing= foodCatListing.FoodCategoriesListing.fromJson(response.data).data!;
      notifyListeners();
    }else{
      warningToast("food categories having some issue");
    }
  }

  getTopRestaurant() async {
    PopularRestaurantCategories =[];
    Response response = await apiProvider.get(
      url: "/top-restorent.html",
    );
    if (response.data['status'] == true && response.data['data'] != null ) {
    //  successToast(response.data['message']);
      PopularRestaurantCategories = resCat.RestaurantListingByCategory.fromJson(response.data).data!;
      notifyListeners();
    }
  }

}
