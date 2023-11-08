import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/modals/restaurants/RestaurantDetails.dart';
import 'package:foodui/screens/food/restaurantDetailViewScreen.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../modals/foods/food.dart';
import '../../provider/cart.dart';
import '../../provider/ordersProviders.dart';
import '../../utils/helper.dart';

class FoodCompactDetailCard extends StatefulWidget {
  FoodCompactDetailCard({
    Key? key,
    @required String? name,
    @required String? image,
    @required String? foods,
    @required String? food_description,
    @required String? price,
    bool? ispro,
    bool? topchoice,
    int? cartItem = 0,
    required String? foodId,
    required int? restaurantId,
    int? menuId,
    final VoidCallback? addItem,
    final VoidCallback? removeItem,
    final RestaurantDetails? restaurantDetails,
  })  : _name = name,
        _image = image,
        _foods = foods,
        _food_description = food_description,
        _ispro = ispro,
        _topchoice = topchoice,
        _foodId = foodId,
        _restaurantId = restaurantId,
        _menuId = menuId,
        _cartItem = cartItem,
        _addItem=addItem,
        _removeItem=removeItem,
        _price=price,
        _restaurantDetails = restaurantDetails,
        super(key: key);

  final String? _name;
  final String? _image;
  final String? _foods;
  final bool? _ispro;
  final bool? _topchoice;
  final String? _foodId;
  final int? _restaurantId;
  final int? _menuId;
  final String? _price;
  final String? _food_description;
  final int? _cartItem;
  final VoidCallback? _addItem;
  final VoidCallback? _removeItem;
  final RestaurantDetails? _restaurantDetails;


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
                            BoxConstraints(minWidth: 100.w, maxWidth: 163.w),
                        child: Text(
                          widget._name!,
                          overflow: TextOverflow.clip,
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
                        Icons.delivery_dining,
                        color: Colors.black54,
                      ),
                      Text(
                        '${widget._price} ₹',
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
                      errorBuilder: (c, o, i) {
                        return Image.asset(
                            Helper.getAssetName("no_image_found.png", "virtual"));
                      }
                  ),
                ),
              ),
              Positioned(
                bottom: -10,
                left: 26.w,
                width: 100.w,
                height: 30.w,
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColor.green,width: 0.7),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.placeholder,
                        offset: Offset(3, 3),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  // color: Colors.red,
                  child:
                  orderProvider.orderQuantity.containsKey!(widget._foodId)
                      && orderProvider.orderQuantity[widget._foodId]! >0?
                  Padding(
                    padding:EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        GestureDetector(
                          onTap:(){
                            cartProvider.removeFromCart(widget._foodId);
                            orderProvider.removeOrder(widget._restaurantId!,
                                widget._foodId!,
                                Foods(
                                  food_id:int.parse( widget._foodId!),
                                    food_name: widget._name,
                                    food_description: widget._food_description,
                                    food_minimum_order: "1",
                                    menu_id: widget._menuId,
                                    img: widget._image!,
                                    food_type: widget._foods,
                                  price: widget._price,),
                                RestaurantDetails(
                                    id: widget._restaurantDetails!.id!.toInt(),
                                    brandName: widget._restaurantDetails!.brandName,
                                    ownerName:widget._restaurantDetails!.ownerName,
                                    phone :widget._restaurantDetails!.ownerMobNumber,
                                    city: widget._restaurantDetails!.city,
                                    pincode: widget._restaurantDetails!.pincode,
                                    ownerEmail:widget._restaurantDetails!.ownerEmail,
                                    storeType: widget._restaurantDetails!.storeType,
                                    address :widget._restaurantDetails!.address,
                                    img1:widget._restaurantDetails!.img1,
                                    img2: widget._restaurantDetails!.img1
                                ),);
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
                              orderProvider.addOrder(widget._restaurantId!,
                                  widget._foodId!,
                                  Foods(
                                    food_id:int.parse( widget._foodId!),
                                    food_name: widget._name,
                                    food_description: widget._food_description,
                                    food_minimum_order: "1",
                                    menu_id: widget._menuId,
                                    img: widget._image!,
                                    food_type: widget._foods,
                                    price: widget._price,),
                                  RestaurantDetails(
                                      id: widget._restaurantDetails!.id!.toInt(),
                                      brandName: widget._restaurantDetails!.brandName,
                                      ownerName:widget._restaurantDetails!.ownerName,
                                      phone :widget._restaurantDetails!.ownerMobNumber,
                                      city: widget._restaurantDetails!.city,
                                      pincode: widget._restaurantDetails!.pincode,
                                      ownerEmail:widget._restaurantDetails!.ownerEmail,
                                      storeType: widget._restaurantDetails!.storeType,
                                      address :widget._restaurantDetails!.address,
                                      img1:widget._restaurantDetails!.img1,
                                      img2: widget._restaurantDetails!.img1
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
                  ):
                  GestureDetector(
                    onTap: (){
                  //successToast(widget._restaurantId!.toString());
                      cartProvider.addToCart(widget._foodId);
                      orderProvider.addOrder(widget._restaurantId!,
                          widget._foodId!,
                          Foods(
                            food_id:int.parse( widget._foodId!),
                            food_name: widget._name,
                            food_description: widget._food_description,
                            food_minimum_order: "1",
                            menu_id: widget._menuId,
                            img: widget._image!,
                            food_type: widget._foods,
                            price: widget._price,),
                          RestaurantDetails(
                              id: widget._restaurantDetails!.id!.toInt(),
                              brandName: widget._restaurantDetails!.brandName,
                              ownerName:widget._restaurantDetails!.ownerName,
                              phone :widget._restaurantDetails!.ownerMobNumber,
                              city: widget._restaurantDetails!.city,
                              pincode: widget._restaurantDetails!.pincode,
                              ownerEmail:widget._restaurantDetails!.ownerEmail,
                              storeType: widget._restaurantDetails!.storeType,
                              address :widget._restaurantDetails!.address,
                              img1:widget._restaurantDetails!.img1,
                              img2: widget._restaurantDetails!.img1
                          ));
                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Container(
                          padding: EdgeInsets.only(left: 32,top: 2).r,
                          child: Text(
                            "ADD",
                            style: TextStyle(
                                color: AppColor.green,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15,top: 2).r,
                          child: Icon(Icons.add,color: AppColor.green,size: 13.sp,),
                        )
                      ],
                    ),
                  )
                  ,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
