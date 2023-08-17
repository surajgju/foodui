import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/screens/orders/checkoutScreen.dart';
import 'package:foodui/utils/helper.dart';
import 'package:foodui/widgets/customNavBar.dart';
import 'package:provider/provider.dart';

import '../../provider/cart.dart';
import '../../provider/orders.dart';
import 'orderItems.dart';
import 'orderedRestaurantDetail.dart';

class MyOrderScreen extends StatelessWidget {
  static const routeName = "/myOrderScreen";
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final cartProvider = Provider.of<Cart>(context);
    final orderProvider = Provider.of<Orders>(context);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: orderProvider.orders.keys.length>0? Column(
              children: [
                Row(
                  children: [

                    SizedBox(width: 15.w,),
                    Expanded(
                      child: Text(
                        "My Order",
                        style: Helper.getTheme(context).headline5,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: OrderdRestaurantDetails()
                ),
                SizedBox(
                  height: 30,
                ),
                OrderItems(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColor.placeholder.withOpacity(0.25),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Delivery Instruction",
                                style: Helper.getTheme(context).headline3,
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: AppColor.green,
                                    ),
                                    Text(
                                      "Add Notes",
                                      style: TextStyle(
                                        color: AppColor.green,
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Sub Total",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          Text(
                            "\$${orderProvider.subTotal}",
                            style: Helper.getTheme(context).headline3?.copyWith(
                                  color: AppColor.green,
                                ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Delivery Cost",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          Text(
                            "\$${orderProvider.deliveryCost}",
                            style: Helper.getTheme(context).headline3?.copyWith(
                                  color: AppColor.green,
                                ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: AppColor.placeholder.withOpacity(0.25),
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          Text(
                            "\$${orderProvider.subTotal+orderProvider.deliveryCost}",
                            style: Helper.getTheme(context).headline3?.copyWith(
                                  color: AppColor.green,
                                  fontSize: 22,
                                ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(CheckoutScreen.routeName);
                          },
                          child: Text("Checkout"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ):Column(children: [
              Row(
                children: [

                  SizedBox(width: 15.w,),
                  Expanded(
                    child: Text(
                      "My Order",
                      style: Helper.getTheme(context).headline5,
                    ),
                  )
                ],
              ),
              SizedBox(height: 90.h,),
              Image.asset(Helper.getAssetName("no_orders.png", "virtual")),
              Center(child: Text("NO ORDERS",style: TextStyle(fontSize: 20)),)
            ],),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(orders: true,),
          ),
        ],
      ),
    );
  }
}
