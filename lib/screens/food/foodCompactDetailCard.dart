import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/food/restaurantDetailViewScreen.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../modals/foods/food.dart';
import '../../modals/restaurants/restaurant.dart';
import '../../provider/cart.dart';
import '../../provider/orders.dart';
import '../../utils/helper.dart';

class FoodCompactDetailCard extends StatefulWidget {
  FoodCompactDetailCard({
    Key? key,
    @required String? name,
    @required String? image,
    @required String? foods,
    bool? ispro,
    bool? topchoice,
    int? cartItem = 0,
    required String? foodId,
    final VoidCallback? addItem,
    final VoidCallback? removeItem,
  })  : _name = name,
        _image = image,
        _foods = foods,
        _ispro = ispro,
        _topchoice = topchoice,
        _foodId = foodId,
        _cartItem = cartItem,
        _addItem=addItem,
        _removeItem=removeItem,
        super(key: key);

  final String? _name;
  final String? _image;
  final String? _foods;
  final bool? _ispro;
  final bool? _topchoice;
  final String? _foodId;
  final int? _cartItem;
  final VoidCallback? _addItem;
  final VoidCallback? _removeItem;

  @override
  State<FoodCompactDetailCard> createState() => _FoodCompactDetailCardState();
}

class _FoodCompactDetailCardState extends State<FoodCompactDetailCard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final cartProvider = Provider.of<Cart>(context);
    final orderProvider = Provider.of<Orders>(context);

    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed(RestaurantDetailViewScreen.routeName,
        //     arguments: {"restaurantId": widget._foodId});
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 110.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        constraints:
                            BoxConstraints(minWidth: 100.w, maxWidth: 200.w),
                        child: Text(
                          widget._name!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Helper.getTheme(context)
                              .headlineMedium
                              ?.copyWith(
                                  color: AppColor.primary, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (widget._ispro != null)
                        Container(
                          padding: EdgeInsets.only(
                                  left: 5, right: 5, bottom: 2, top: 2)
                              .r,
                          decoration: BoxDecoration(
                              color: Color(0xff011ddd),
                              borderRadius: BorderRadius.circular(3).w),
                          child: Text(
                            "pro"!,
                            style: Helper.getTheme(context)
                                .headlineSmall
                                ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600),
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Text(widget._foods ?? "Western Food",
                          style: TextStyle(color: Colors.black54)),
                      SizedBox(
                        width: 20.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFFFD700),
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "4.9",
                        style: TextStyle(
                          color: AppColor.green,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text('(124) Ratings'),
                      if (widget._topchoice != null)
                        Container(
                          padding: EdgeInsets.only(
                                  left: 5, right: 5, bottom: 4, top: 4)
                              .r,
                          decoration: BoxDecoration(
                              color: Color(0xfffde7e3),
                              borderRadius: BorderRadius.circular(5).w),
                          child: Row(
                            children: [
                              Image.asset(
                                Helper.getAssetName(
                                    "fav_filled.png", "virtual"),
                                width: 12.w,
                              ),
                              Text(
                                "Top choice"!,
                                style: Helper.getTheme(context)
                                    .headlineSmall
                                    ?.copyWith(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.watch_later_outlined),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "39 mins",
                        style: TextStyle(
                          color: AppColor.primary,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Icon(
                        Icons.pedal_bike,
                        color: Colors.black54,
                      ),
                      Text(
                        'ADE 7.50',
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8).w,
                child: Container(
                  // padding: EdgeInsets.fromLTRB(5, 5, 5, 5).r,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8)),
                  width: 150.w,
                  height: 100.h,
                  child: Image.network(
                    widget._image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -10,
                left: 26.w,
                width: 100.w,
                height: 30.w,
                child: Container(
                  padding:EdgeInsets.only(left: 10,right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColor.placeholder),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.placeholder,
                        offset: Offset(3, 3),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap:(){
                          cartProvider.removeFromCart(widget._foodId);
                          orderProvider.removeOrder("9cO7oNxlZG1zahF397s2",
                              widget._foodId!,
                              Foods(
                                  food_name: widget._name,
                                  food_description: "delicious taste and sugar free",
                                  food_minimum_order: "1",
                                  food_rating: "4.8",
                                  cuisines_id: "2,1",
                                  food_images: [widget._image!],
                                  food_type: "French",
                                  food_price: "23",
                                  food_reviews_id: "snFdsEFEnjsds"),
                              Restaurants(rest_name: "restaurent 1",
                                  rest_owner_name:"owner name",
                                  rest_owner_number :"+91 8168673754",
                                  rest_description:"restaurant description in datail. Fast food available",
                                  rest_address :"16 street, park avenue, New york,USA",
                                  rest_opening_hrs : "9:30 AM - 12:30 AM",
                                  rest_delivery_time:"30 min",
                                  rest_minimum_order :"1",
                                  rest_rating:"2.5",
                                  cuisines_id:"2,4",
                                  rest_menu_images :["https://images.unsplash.com/photo-1552566626-52f8b828add9"]
                              ));
                        },
                        child: Container(
                          child: Text(
                            "−",
                            style: TextStyle(
                                color: AppColor.green,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Text(
                        "${orderProvider.orderQuantity.containsKey!(widget._foodId)?orderProvider.orderQuantity[widget._foodId]:0}",
                        style: TextStyle(
                            color: AppColor.green,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: (){

                            cartProvider.addToCart(widget._foodId);
                            orderProvider.addOrder("9cO7oNxlZG1zahF397s2",
                                widget._foodId!,
                                Foods(
                                    food_name: widget._name,
                                    food_description: "delicious taste and sugar free",
                                    food_minimum_order: "1",
                                    food_rating: "4.8",
                                    cuisines_id: "2,1",
                                    food_images: [widget._image!],
                                    food_type: "French",
                                    food_price: "23",
                                    food_reviews_id: "snFdsEFEnjsds"),
                                Restaurants(rest_name: "restaurent 1",
                                    rest_owner_name:"owner name",
                                    rest_owner_number :"+91 8168673754",
                                    rest_description:"restaurant description in datail. Fast food available",
                                    rest_address :"16 street, park avenue, New york,USA",
                                    rest_opening_hrs : "9:30 AM - 12:30 AM",
                                    rest_delivery_time:"30 min",
                                    rest_minimum_order :"1",
                                    rest_rating:"2.5",
                                    cuisines_id:"2,4",
                                    rest_menu_images :["https://images.unsplash.com/photo-1552566626-52f8b828add9"]
                                ));


                        },

                        child: Container(
                          child: Text(
                            "+",
                            style: TextStyle(
                                color: AppColor.green,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
