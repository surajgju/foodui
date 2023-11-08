import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/modals/foods/food.dart';
import 'package:foodui/modals/restaurants/RestaurantDetails.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:logger/logger.dart';

import '../const/colors.dart';
import '../screens/home/homeScreen.dart';
import '../screens/tracking/order_status.dart';
import '../utils/api_provider.dart';
import '../utils/helper.dart';

class Orders extends ChangeNotifier {
  RestaurantDetails orderRestaurantDetail = RestaurantDetails();
  String orderRestaurant_id = '';
  Map<String, Foods> orders = {};
  Map<String, int> orderQuantity = {};

  num subTotal = 0;
  num deliveryCost = 2;
  num discount = 2;
  num couponAmount = 0;

  String couponCode = "";
  List<String> validCoupons = ["FIRST","NEW","HELLO","Unique"];
  APIProvider apiProvider = APIProvider();

  TextEditingController deliveryInstruction =TextEditingController();
  // addOrder(int restaurant_id, String food_id, Foods food,
  //     RestaurantDetails restaurantDetail) {
  //   if (!orderQuantity.containsKey(food_id)) {
  //     restaurant_id = restaurant_id;
  //     orderRestaurantDetail = restaurantDetail;
  //     orders[food_id] = food;
  //     orderQuantity[food_id] = 1;
  //     //add in sub-total
  //     subTotal = subTotal + num.parse(food.price!);
  //
  //   } else {
  //     orderQuantity[food_id] = orderQuantity[food_id]! + 1;
  //     //add in sub-total
  //     subTotal = subTotal + num.parse(food.price!);
  //   }
  // }
  addOrder(int restaurant_id, String food_id, Foods food,
      RestaurantDetails restaurantDetail){
    if (!orderQuantity.containsKey(food_id)) {
          restaurant_id = restaurant_id;
          orderRestaurantDetail = restaurantDetail;
          orders[food_id] = food;
          orderQuantity[food_id] = 1;
          //add in sub-total
          subTotal = subTotal + num.parse(food.price!);

        } else {
          orderQuantity[food_id] = orderQuantity[food_id]! + 1;
          //add in sub-total
          subTotal = subTotal + num.parse(food.price!);
        }
    var data = json.encode({
      "product_id": food_id,
      "product_name": food.food_name,
      "product_img": food.img,
      "product_price": food.price,
      "product_description": food.food_description,
      "product_qty": orderQuantity,
      "restaurent_name": restaurantDetail.name,
      "delevery_fee": "25"
    });
    Response res = apiProvider.post(url: "/add-to-cart", payload: data);
  }

  /*$product_id = $request->product_id;
        $product_name = $request->product_name;
        $product_img = $request->product_img;
        $product_price = $request->product_price;
        $product_description = $request->product_description;
        $product_qty = $request->product_qty;
        $restaurent_name = $request->restaurent_name;
        $delevery_fee = $request->delevery_fee;
      $request->grediant --> With mutilpe product item ids*/

  removeOrder(int restaurant_id, String food_id, Foods food,
      RestaurantDetails restaurantDetails) {
    if (orderQuantity.containsKey(food_id) && orderQuantity[food_id] == 1) {
      orderRestaurant_id = "";
      orders.remove(food_id);
      orderQuantity.remove(food_id);

      //remove from sub-total
      if (subTotal > num.parse(food.price!))
        subTotal = subTotal - num.parse(food.price!);
    } else {
      orderQuantity[food_id] = orderQuantity[food_id]! - 1;
      //remove from sub-total
      subTotal = subTotal - num.parse(food.price!);
    }
  }

  bool validateCoupon(){
    if(couponCode.isEmpty){
      return false;
    }else if(validCoupons.contains(couponCode)){

      return true;
    }else{
      return false;
    }
  }

  calculateCouponAmount(appliedCouponCode){
    num localAmount=0;
    if(appliedCouponCode == "NEW"){
      localAmount =2;
    }else
    if(appliedCouponCode == "FIRST"){
      localAmount =3;
    }else
    if(appliedCouponCode == "HELLO"){
      localAmount =1.5;
    }
    couponAmount=  localAmount;
    subTotal= subTotal-localAmount;
    notifyListeners();
  }

  prepareOrderDetails(){
    var orderPayload ={};
    orders.forEach((key, value) {
      orderPayload[key]= {
        "food_name": value.food_name,
        "food_id": value.food_id,
        "vendor_id": orderRestaurantDetail.id,
        "food_qty": orderQuantity[value.food_id.toString()],
        "food_description": value.food_description,
        "food_minimum_order": "1",
        "food_rating": "4.8",
        "cuisines_id": value.menu_id,
        "food_images":value.img,
        "food_type": value.food_type,
        "food_price": value.price,
      };
    });
    // var logger = Logger();
    // logger.i({
    //   "product_detail":orderPayload,
    //   "payment_type":"COD"
    // });
    var orderDetails = json.encode({
      "product_detail":orderPayload,
      "payment_type":"COD"
    });
    return orderDetails;
  }


  placeOrder(context)async{
  var orderDetails =  prepareOrderDetails();
  //ToDo:need to remove temp code
  showConfirmation(context);
  if(orderDetails != null){
    Response response = await apiProvider.post(
      url: "/food_order_test.php",
      payload: orderDetails
    );

    if( response != null && response.data['status'] == true ){
     // successToast(response.data['message']);
      showConfirmation(context);
    }


  }
  }
  showConfirmation(context){
    ScreenUtil.init(context);
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            height: Helper.getScreenHeight(context) * 0.7,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ],
                  ),
                  Image.asset(
                    Helper.getAssetName(
                      "order_confirm.png",
                      "virtual",
                    ),
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Thank You!",
                    style: TextStyle(
                      color: AppColor.primary,
                      fontWeight: FontWeight.w900,
                      fontSize: 30.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "for your order",
                    style: Helper.getTheme(context)
                        .headline4
                        ?.copyWith(color: AppColor.primary),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 20.0)
                  //       .r,
                  //   child: Text(
                  //       "Your order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your order"),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ).r,
                    child: SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, OrderStatus.routeName);

                        },
                        child: Text("Check Order Status"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(
                            HomeScreen.routeName);
                      },
                      child: Text(
                        "Back To Home",
                        style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

}
