import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/const/urls.dart';
import 'package:foodui/modals/restaurants/restaurant.dart';
import 'package:foodui/screens/food/restaurantDetailMainCard.dart';
import 'package:provider/provider.dart';

import '../../modals/foods/food.dart';
import '../../provider/cart.dart';
import '../../provider/orders.dart';
import '../../utils/helper.dart';
import '../orders/myOrderScreen.dart';
import 'foodCompactDetailCard.dart';

class RestaurantDetailViewScreen extends StatefulWidget {
  static const routeName = "/restaurantDetailViewScreen";

  RestaurantDetailViewScreen({super.key});

  @override
  State<RestaurantDetailViewScreen> createState() =>
      _RestaurantDetailViewScreenState();
}

class _RestaurantDetailViewScreenState
    extends State<RestaurantDetailViewScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  List<Foods> foodList = [
    Foods(
        food_name: "pastry",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        cuisines_id: "2,1",
        food_images: [
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187"
        ],
        food_type: "Indian",
        food_price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "Burger",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        cuisines_id: "2,1",
        food_images: [
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187"
        ],
        food_type: "French",
        food_price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "pizza",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        cuisines_id: "2,1",
        food_images: [
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187"
        ],
        food_type: "Italian",
        food_price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "Momos",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        cuisines_id: "2,1",
        food_images: [
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187"
        ],
        food_type: "Chinese",
        food_price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "Noodles",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        cuisines_id: "2,1",
        food_images: [
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187"
        ],
        food_type: "Chinese",
        food_price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "Samose",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        cuisines_id: "2,1",
        food_images: [
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187"
        ],
        food_type: "Indian",
        food_price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
  ];
List<String> foodIdList =["2Pn7TxwYih0sVsPDfHFZ",
  "XRBuRgEFX3qMk0CLzSDY",
  "aNffFjWp6J6R1XgqeCcx",
"euhklFhijaTVRZb9hsR2",
  "sQIJUSWuJDPbvEiAEKyU",
  "2Pn7TxwYih0sVsPDfHFZ",
  "XRBuRgEFX3qMk0CLzSDY",
  "aNffFjWp6J6R1XgqeCcx",
  "euhklFhijaTVRZb9hsR2",
  "sQIJUSWuJDPbvEiAEKyU",
  "2Pn7TxwYih0sVsPDfHFZ",
  "XRBuRgEFX3qMk0CLzSDY",
  "aNffFjWp6J6R1XgqeCcx",
  "euhklFhijaTVRZb9hsR2",
  "sQIJUSWuJDPbvEiAEKyU"];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final cartProvider = Provider.of<Cart>(context);
    final orderProvider = Provider.of<Orders>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(controller: _scrollController, slivers: [
            SliverAppBar(
              // key: Key("new"),
              pinned: true,
              floating: true,
              snap: true,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5).r,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black87,
                  ),
                ),
              ),
              actions: [
                Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8).r,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(Icons.more_vert_outlined, color: Colors.black87),
                )
              ],

              expandedHeight: 0.33.sh,
              flexibleSpace: FlexibleSpaceBar(
                // title: Text("Aqaya Dubai",style: TextStyle(color: Colors.black),),

                background: Stack(
                  children: [
                    Image.asset(
                      "assets/images/real/western2.jpg",
                      height: 0.28.sh,
                      width: 1.sw,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(1.sw, 0.26.sh),
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      _scrollToItem(13);
                    },
                    child: RestaurantDescriptionCard(
                      name: "Aqaya Dubai",
                      image: "assets/images/real/restaurant01.jpeg",
                      restaurantId: 1,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Build the list of items
                return Container(
                  margin: EdgeInsets.only(left: 15, right: 10, top: 15),
                  child: FoodCompactDetailCard(
                    // name: "Pizza",
                    name: foodList[index].food_name,
                    image: foodList[index].food_images![0],
                    foodId: foodIdList[index],
                    foods: "Arabian,Indian,Americal",
                  ),
                );
              },
              childCount: foodList.length,
            ))
          ]),
          if (cartProvider.cart.length > 0)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                width: double.maxFinite,
                height: 50.h,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        Helper.getAssetName("cart.png", "virtual"),
                        scale: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 5),
                      child: Row(
                        children: [
                          Text("${cartProvider.cart.length} ITEMS ADDED",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12)),
                          Icon(
                            Icons.arrow_drop_up_outlined,
                            color: AppColor.green,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(MyOrderScreen.routeName);
                      },
                      child: Container(
                        width: 130.w,
                        height: 35.h,
                        //   padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),

                        decoration: BoxDecoration(
                          color: AppColor.green,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Icon(
                                  Icons.arrow_right,
                                  size: 16.sp,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){},
      // ),
    ); // Number of items in the list
  }

  void _scrollToItem(int index) {
    // Calculate the height of each list item based on its index
    double itemHeight =
        56.0; // Change this value based on your list item's height
    double offset = index * itemHeight;

    // Scroll to the desired position using animateTo
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
