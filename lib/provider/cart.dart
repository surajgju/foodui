
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{

  List<String> _cart = [];
  bool cartDetailVisibility = false;
  get cart => _cart;
  addToCart(product_id){
    _cart.add(product_id);
    notifyListeners();
  }

  removeFromCart(product_id){
   if(_cart.contains(product_id)){
     _cart.remove(product_id);
     notifyListeners();
   }

  }

}