import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/screens/orders/checkoutScreen.dart';
import 'package:foodui/utils/helper.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:foodui/widgets/customNavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../provider/cart.dart';
import '../../provider/ordersProviders.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 0, top: 5, bottom: 5, right: 5).r,
            // decoration: BoxDecoration(
            //     color: Colors.white, shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black87,
            ),
          ),
        ),
        title: Text(
          "My Order",
          style: Helper.getTheme(context).headline5,
        ),
      ),
      body: SafeArea(
        child: orderProvider.orders.keys.length > 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //
                    //     SizedBox(width: 15.w,),
                    //     Expanded(
                    //       child: Text(
                    //         "My Order",
                    //         style: Helper.getTheme(context).headline5,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OrderdRestaurantDetails()),
                    SizedBox(
                      height: 30,
                    ),
                    OrderItems(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Container(
                            //height: 50,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColor.placeholder.withOpacity(0.25),
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Delivery Instruction",
                                        style:
                                            Helper.getTheme(context).titleMedium,
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () => showNotes(context),
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
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                                if (orderProvider
                                    .deliveryInstruction.text.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_right,
                                          color: AppColor.primary,
                                          size: 14,
                                        ),
                                        Container(
                                         // width: 300.w,
                                          constraints: BoxConstraints(maxWidth: 310.w),
                                          child: Text(
                                            orderProvider.deliveryInstruction.text,
                                            style: TextStyle(
                                              color: AppColor.primary,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColor.placeholder.withOpacity(0.25),
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () => applyCoupon(context),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/virtual/gift-card.png",
                                    width: 30.w,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Apply Coupon",
                                          style: Helper.getTheme(context)
                                              .titleMedium,
                                        ),
                                        if (orderProvider.validateCoupon())
                                          SizedBox(
                                            width: 100.w,
                                            child: Text(
                                              orderProvider.couponCode,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      GoogleFonts.openSans()
                                                          .fontFamily),
                                              maxLines: 1,
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColor.primary,
                                  )
                                ],
                              ),
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
                                  style: Helper.getTheme(context).titleMedium!.copyWith(color: AppColor.primary),
                                ),
                              ),
                              Text(
                                "${orderProvider.subTotal} \₹",
                                style: Helper.getTheme(context)
                                    .titleMedium
                                    ?.copyWith(
                                      color: AppColor.primary,
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
                                  style: Helper.getTheme(context).titleMedium,
                                ),
                              ),
                              Text(
                                "${orderProvider.deliveryCost} \₹",
                                style: Helper.getTheme(context)
                                    .titleMedium
                                    ?.copyWith(
                                      color: AppColor.primary,
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
                                  style: Helper.getTheme(context).titleMedium,
                                ),
                              ),
                              Text(
                                "${orderProvider.subTotal + orderProvider.deliveryCost} \₹",
                                style: Helper.getTheme(context)
                                    .titleMedium
                                    ?.copyWith(
                                      color: AppColor.green,

                                    ),
                              )
                            ],
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            height: 50.h,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                var logger = Logger();
                                // logger.i(json.encode(orderProvider.orders));
                                // logger.i(json.encode(orderProvider.orderQuantity));

                                Navigator.of(context)
                                    .pushNamed(CheckoutScreen.routeName);
                              },
                              child: Text("Checkout",),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  Image.asset(Helper.getAssetName("no_orders.png", "virtual")),
                  Center(
                    child: Text("NO ORDERS", style: TextStyle(fontSize: 20)),
                  )
                ],
              ),
      ),
    );
  }

  showNotes(context) {
    final orderProvider = Provider.of<Orders>(context, listen: false);

    return showDialog(
        context: context,
        builder: (context) {

          return AlertDialog(
            title: Text("Add delivery Instructions"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.green)),
                    enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.green)),
                    disabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.green)),
                    // labelText: "note",
                    contentPadding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                  ),
                  // controller: orderProvider.deliveryInstruction,
                  onChanged: (value) {
                    orderProvider.deliveryInstruction.text = value;
                  },
                  maxLines: 3,
                  initialValue: orderProvider.deliveryInstruction.text.isNotEmpty ?orderProvider.deliveryInstruction.text:"",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("CANCEL",style: Helper.getTheme(context).titleMedium,)),
                    TextButton(
                        onPressed: () {
                          successToast("Instruction added Successfully");
                          Navigator.of(context).pop();
                        },
                        child: Text("SUBMIT",style: Helper.getTheme(context).titleMedium,))
                  ],
                ),
              ],
            ),
          );
        });
  }

  applyCoupon(context) {
    final orderProvider = Provider.of<Orders>(context, listen: false);

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Apply Coupon Code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter coupon code',
                      border: OutlineInputBorder(borderSide: BorderSide(color: AppColor.green)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.green)),
                      disabledBorder:OutlineInputBorder(borderSide: BorderSide(color: AppColor.green)),
                    ),
                    onChanged: (value) {
                      orderProvider.couponCode = value;
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          // Apply coupon logic here
                          if (orderProvider.validateCoupon()) {
                            // Apply the coupon code
                            // You can add your coupon validation logic here
                            orderProvider.calculateCouponAmount(
                                orderProvider.couponCode);
                            successToast("Coupon Applied Successfully");
                            Navigator.pop(context);
                          } else {
                            warningToast("Add a valid coupon");
                            // Show an error or message indicating no coupon code
                          }
                        },
                        child: Text('Apply'),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
