
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../provider/cart.dart';
import '../../provider/ordersProviders.dart';
import '../../utils/helper.dart';

class OrderItems extends StatefulWidget {
  const OrderItems({super.key});

  @override
  State<OrderItems> createState() => _OrderdRestaurantDetailsState();
}

class _OrderdRestaurantDetailsState extends State<OrderItems> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final cartProvider = Provider.of<Cart>(context);
    final orderProvider = Provider.of<Orders>(context);
    return  Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Text("ITEMS IN CART",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            ),),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 20),
           // height: 200,
            child: ListView.builder(
              physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: orderProvider.orders.keys.length,
                itemBuilder: (c,i){
                String id = orderProvider.orders.keys.elementAt(i);
                  return OrderItemCard(
                      price:( num.parse(orderProvider.orders[id]!.price!) * orderProvider.orderQuantity[id]!).toString(),
                      name: orderProvider.orders[id]!.food_name!,
                      quantity:orderProvider.orderQuantity[id]

                  );
                }),
          ),
        ],
      ),
    );
  }
}

class OrderItemCard extends StatelessWidget {
   OrderItemCard({
    Key? key,
    String? name,
    String? price,
    bool? isLast = false,
    int? quantity,
  })  : _name = name,
        _price = price,
        _isLast = isLast,
  _quantity = quantity,
        super(key: key);

  final String? _name;
  final String? _price;
  final bool? _isLast;
  int? _quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: _isLast!
              ? BorderSide.none
              : BorderSide(
            color: AppColor.placeholder.withOpacity(0.25),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${_name![0].toUpperCase()+ _name!.substring(1)} x$_quantity",
              style: Helper.getTheme(context)
                  .titleMedium,
            ),
          ), Container(
            padding:EdgeInsets.only(left: 8,right: 8),
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 0.4),
              borderRadius: BorderRadius.circular(6)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap:(){
                    // cartProvider.removeFromCart(widget._foodId);
                    // orderProvider.removeOrder(widget._restaurantId!,
                    //     widget._foodId!,
                    //     Foods(
                    //       food_id:int.parse( widget._foodId!),
                    //       food_name: widget._name,
                    //       food_description: widget._food_description,
                    //       food_minimum_order: "1",
                    //       menu_id: widget._menuId,
                    //       img: widget._image!,
                    //       food_type: widget._foods,
                    //       price: widget._price,),
                    //     Restaurant(
                    //         id: widget._restaurantDetails!.id,
                    //         brandName: widget._restaurantDetails!.brandName,
                    //         ownerName:widget._restaurantDetails!.ownerName,
                    //         mobNumber :widget._restaurantDetails!.ownerMobNumber,
                    //         restaurantCity: widget._restaurantDetails!.restaurantCity,
                    //         restaurantPin: widget._restaurantDetails!.restaurantPin,
                    //         ownerEmail:widget._restaurantDetails!.ownerEmail,
                    //         storeType: widget._restaurantDetails!.storeType,
                    //         restaurantAddress :widget._restaurantDetails!.restaurantAddress,
                    //         img1:widget._restaurantDetails!.img1,
                    //         img2: widget._restaurantDetails!.img1
                    //     ));
                  },
                  child: Container(
                    child: Text(
                      "−",
                      style: TextStyle(
                          color: AppColor.green,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left: 12,right: 12),
                  child: Text(_quantity.toString(),
                  //  "${orderProvider.orderQuantity.containsKey!(widget._foodId)?orderProvider.orderQuantity[widget._foodId]:0}",
                    style: TextStyle(
                        color: AppColor.green,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                    // cartProvider.addToCart(widget._foodId);
                    // orderProvider.addOrder(widget._restaurantId!,
                    //     widget._foodId!,
                    //     Foods(
                    //       food_id:int.parse( widget._foodId!),
                    //       food_name: widget._name,
                    //       food_description: widget._food_description,
                    //       food_minimum_order: "1",
                    //       menu_id: widget._menuId,
                    //       img: widget._image!,
                    //       food_type: widget._foods,
                    //       price: widget._price,),
                    //     Restaurant(
                    //         id: widget._restaurantDetails!.id,
                    //         brandName: widget._restaurantDetails!.brandName,
                    //         ownerName:widget._restaurantDetails!.ownerName,
                    //         mobNumber :widget._restaurantDetails!.ownerMobNumber,
                    //         restaurantCity: widget._restaurantDetails!.restaurantCity,
                    //         restaurantPin: widget._restaurantDetails!.restaurantPin,
                    //         ownerEmail:widget._restaurantDetails!.ownerEmail,
                    //         storeType: widget._restaurantDetails!.storeType,
                    //         restaurantAddress :widget._restaurantDetails!.restaurantAddress,
                    //         img1:widget._restaurantDetails!.img1,
                    //         img2: widget._restaurantDetails!.img1
                    //     ));
                  },

                  child: Container(
                    child: Text(
                      "+",
                      style: TextStyle(
                          color: AppColor.green,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            "$_price \₹",
            style: Helper.getTheme(context)
                .titleMedium,
          )
        ],
      ),
    );
  }
}
