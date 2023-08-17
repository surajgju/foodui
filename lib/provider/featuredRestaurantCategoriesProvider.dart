
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../const/firebase.dart';
import '../modals/featured/featuredRestaurantCategories.dart';
import '../modals/restaurants/restaurant.dart';

class FeaturedRestaurantCategoriesProvider extends ChangeNotifier {
  List<RestaurantCategoriesItem> PopularRestaurantCategories = [];
  Map<String, Restaurants> PopularRestaurantCategoriesItem = {};

  getPopularRestaurant(food_featured_Id) async {
    try {  PopularRestaurantCategories = [];
    PopularRestaurantCategoriesItem={};
    QuerySnapshot featuredFoodCategories = await FirebaseFirestore.instance
        .collection(FirebaseConst.FEATURED_FOOD_CATEGORIES)
        .doc(food_featured_Id)
        .collection(FirebaseConst.FOOD_CATEGORIES_ITEM)
        .get();
    featuredFoodCategories.docs.forEach((e) async {
      String res_id = RestaurantCategoriesItem.fromJson((e.data() as Map<String, dynamic>)).restaurant_id!;
      final resData = await getRestaurant(res_id);
      if (resData != null) {
        final data = Restaurants.fromJson((resData as Map<String, dynamic>));
        PopularRestaurantCategories.add(RestaurantCategoriesItem.fromJson((e.data() as Map<String, dynamic>)));
        PopularRestaurantCategoriesItem[res_id] = data;
      }
      notifyListeners();
    });
    } catch (err) {
      print(err);
    }
  }
  getRestaurant(doc_id) async {
    DocumentSnapshot food = await FirebaseFirestore.instance
        .collection(FirebaseConst.RESTAURANTS)
        .doc(doc_id)
        .get();
    return food.data();
  }
}