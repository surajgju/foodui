import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../const/firebase.dart';
import '../modals/featured/featuredFoodCategories.dart';
import '../modals/foods/food.dart';

class FeaturedCategoriesProvider extends ChangeNotifier {
  List<FoodCategoriesItem> foodCategory = [];
  Map<String, Foods> foodCategoryFoods = {};

  List<FoodCategoriesItem> foodCategory2 = [];
  Map<String, Foods> foodCategoryFoods2 = {};

  getFeaturedFoodCategories(food_featured_Id) async {
    try {  foodCategory = [];
    foodCategoryFoods={};
    QuerySnapshot featuredFoodCategories = await FirebaseFirestore.instance
        .collection(FirebaseConst.FEATURED_FOOD_CATEGORIES)
        .doc(food_featured_Id)
        .collection(FirebaseConst.FOOD_CATEGORIES_ITEM)
        .get();
      featuredFoodCategories.docs.forEach((e) async {
        String food_id = FoodCategoriesItem.fromJson((e.data() as Map<String, dynamic>)).food_id!;
        final foodData = await getFood(food_id);
        if (foodData != null) {
          final data = Foods.fromJson((foodData as Map<String, dynamic>));
          foodCategory.add(FoodCategoriesItem.fromJson((e.data() as Map<String, dynamic>)));
          foodCategoryFoods[food_id] = data;
        }
        notifyListeners();
      });
    } catch (err) {
      print(err);
    }
  }
  getFeaturedFoodCategories2(food_featured_Id) async {
    try {  foodCategory2 = [];
    foodCategoryFoods2={};
    QuerySnapshot featuredFoodCategories = await FirebaseFirestore.instance
        .collection(FirebaseConst.FEATURED_FOOD_CATEGORIES)
        .doc(food_featured_Id)
        .collection(FirebaseConst.FOOD_CATEGORIES_ITEM)
        .get();
    featuredFoodCategories.docs.forEach((e) async {
      String food_id = FoodCategoriesItem.fromJson((e.data() as Map<String, dynamic>)).food_id!;
      final foodData = await getFood(food_id);
      if (foodData != null) {
        final data = Foods.fromJson((foodData as Map<String, dynamic>));
        foodCategory2.add(FoodCategoriesItem.fromJson((e.data() as Map<String, dynamic>)));
        foodCategoryFoods2[food_id] = data;
      }
      notifyListeners();
    });
    } catch (err) {
      print(err);
    }
  }
  getFood(doc_id) async {
    DocumentSnapshot food = await FirebaseFirestore.instance
        .collection(FirebaseConst.FOODS)
        .doc(doc_id)
        .get();
    return food.data();
  }



}
