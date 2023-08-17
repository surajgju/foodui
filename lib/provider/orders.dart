import 'package:flutter/material.dart';
import 'package:foodui/modals/foods/food.dart';
import 'package:foodui/modals/restaurants/restaurant.dart';

class Orders extends ChangeNotifier {
  Restaurants orderRestaurantDetail = Restaurants();
  String orderRestaurant_id = '';
  Map<String, Foods> orders = {};
  Map<String, int> orderQuantity = {};

  num subTotal = 0;
  num deliveryCost = 2;
  num discount = 2;
  addOrder(String restaurant_id, String food_id, Foods food,
      Restaurants restaurantDetail) {
    if (!orderQuantity.containsKey(food_id)) {
      restaurant_id = restaurant_id;
      orderRestaurantDetail = restaurantDetail;
      orders[food_id] = food;
      orderQuantity[food_id] = 1;
      //add in sub-total
      subTotal = subTotal + num.parse(food.food_price!);
    } else {
      orderQuantity[food_id] = orderQuantity[food_id]! + 1;
      //add in sub-total
      subTotal = subTotal + num.parse(food.food_price!);
    }
  }

  removeOrder(String restaurant_id, String food_id, Foods food,
      Restaurants restaurantDetails) {
    if (orderQuantity.containsKey(food_id) && orderQuantity[food_id] == 1) {
      orderRestaurant_id = "";
      orders.remove(food_id);
      orderQuantity.remove(food_id);

      //remove from sub-total
      if (subTotal > num.parse(food.food_price!))
        subTotal = subTotal - num.parse(food.food_price!);
    } else {
      orderQuantity[food_id] = orderQuantity[food_id]! - 1;
      //remove from sub-total
      subTotal = subTotal - num.parse(food.food_price!);
    }
  }
}
