import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/food/restaurantsCompactDetailCard.dart';
import 'package:provider/provider.dart';
import '../../provider/featuredRestaurantCategoriesProvider.dart';

class RestaurantListing extends StatefulWidget {
  RestaurantListing({super.key, this.isBottomSheet});
  bool? isBottomSheet;
  @override
  State<RestaurantListing> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<RestaurantListing> {
  @override
  Widget build(BuildContext context) {
    final foodController = Provider.of<FeaturedRestaurantCategoriesProvider>(context);
    ScreenUtil.init(context);
    return Container(
     // height: 220.h,
      child: ListView.builder(

        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder:(c,i) {
         return RestaurantCompactDetailCard(
            image: "https://cssfounder.co.uk/CSS133/qconnect/vendor/uploads/40698hotel1.jpg",
            name: "Al Barsha Inasal Restaurant",
            foods: 'Lebanese, BreakFast, Desserts',
            restaurantId: 2,);


        },
      ),
    );
  }



}
