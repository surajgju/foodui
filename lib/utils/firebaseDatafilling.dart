import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodui/const/firebase.dart';
import 'package:logger/logger.dart';

class FirebaseDataFilling extends StatefulWidget {
  const FirebaseDataFilling({super.key});

  @override
  State<FirebaseDataFilling> createState() => _FirebaseDataFillingState();
}

class _FirebaseDataFillingState extends State<FirebaseDataFilling> {
  var logger = Logger(
    printer: PrettyPrinter(), // Use PrettyPrinter for a well-formatted output
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase Data provider"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: ()async {await addFeaturedCategories(); }, child: Text("add Featured food Category")),
              TextButton(
                  onPressed: () async{
                    await addFeaturedRestaurantCategories();
                  },
                  child: Text("add Featured restaurant Category")),
              TextButton(onPressed: () {}, child: Text("add banners")),
              TextButton(
                  onPressed: () async {
                    await addFoods();
                  },
                  child: Text("add foods")),
              TextButton(
                  onPressed: () async {
                    await addRestaurants();
                  },
                  child: Text("add restaurant")),
              // TextButton(onPressed: (){}, child: Text("add FeaturedCategory"))
            ],
          ),
        ),
      ),
    );
  }

  addFeaturedCategories() {
    CollectionReference foodItem = FirebaseFirestore.instance.collection(
        FirebaseConst.FEATURED_FOOD_CATEGORIES +"/"+
            "Z65vGcmjCcxTt93BHUnD" +"/"+
            FirebaseConst.FOOD_CATEGORIES_ITEM);
    // "food_id": "XRBuRgEFX3qMk0CLzSDY",
    // "food_id": "aNffFjWp6J6R1XgqeCcx",
    // "food_id": "2Pn7TxwYih0sVsPDfHFZ",
    // "food_id": "sQIJUSWuJDPbvEiAEKyU",

    foodItem
        .add({
          "restaurant_id": "9cO7oNxlZG1zahF397s2",
          "food_id": "2Pn7TxwYih0sVsPDfHFZ",
          "in_offers": true,
          "offer_percentage": "10",
          "offer_price": "120",
        })
        .then((value) => logger.i("item added"))
        .catchError((error) => logger.e("Failed to add item: $error"));
  }

  addRestaurants() {
    CollectionReference restaurants =
        FirebaseFirestore.instance.collection(FirebaseConst.RESTAURANTS);
    restaurants
        .add({
          "rest_name": "My restaurant",
          "rest_owner_name": "Abdul ",
          "rest_owner_number": "+91 8654673654",
          "rest_description":
              "best restaurant in town. best restaurant in town.",
          "rest_address": "36 street, main street, dubai",
          "rest_opening_hrs": "9:30 - 6:30",
          "rest_delivery_time": "30 mins",
          "rest_minimum_order": "1",
          "rest_type": "south indian",
          "rest_rating": "4.3",
          "cuisines_id": "1,2",
          "rest_menu_images": [
            "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
            "https://images.unsplash.com/photo-1504674900247-0877df9cc836"
          ],
        })
        .then((value) => logger.i("restaurant added"))
        .catchError((error) => logger.e("Failed to add restaurant: $error"));
  }

  addFoods() {
    CollectionReference foods =
        FirebaseFirestore.instance.collection(FirebaseConst.FOODS);

    foods
        .add({
          "food_name": "My restaurant",
          "food_description": "best food in town.",
          "food_minimum_order": "1",
          "food_rating": "4.3",
          "cuisines_id": "sdsd",
          "food_images": [
            "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
            "https://images.unsplash.com/photo-1504674900247-0877df9cc836"
          ],
          "food_type": "sssds",
          "food_price": "234",
          "food_reviews_id": "sdsd",
        })
        .then((value) => logger.i("food added"))
        .catchError((error) => logger.e("Failed to add food: $error"));
  }

  addFeaturedRestaurantCategories() {
    CollectionReference foodItem = FirebaseFirestore.instance.collection(
        FirebaseConst.FEATURED_RESTAURANT_CATEGORIES +"/"+
            "YBnxtpjNxTpZTtEmbWiu" +"/"+
            FirebaseConst.RESTAURANT_CATEGORIES_ITEM);
    // "restaurant_id": "9cO7oNxlZG1zahF397s2",
    // "restaurant_id": "Tj1tV7ALsG4cb78cjPtk",
    // "restaurant_id": "aVySs9w6MYO7R7ExuiLS",
    // "restaurant_id": "hg7AQka1IsCp5xlba0PY",
    // "restaurant_id": "ulEo0TXZBQbSHF42YJc5",
    foodItem
        .add({
      "restaurant_id": "hg7AQka1IsCp5xlba0PY",
      "in_offers": true,
      "offer_percentage": "20",
      "offer_price": "",
      "isPro":true,
      "topChoice":false
    })
        .then((value) => logger.i("restaurant added"))
        .catchError((error) => logger.e("Failed to add item: $error"));
  }
}
