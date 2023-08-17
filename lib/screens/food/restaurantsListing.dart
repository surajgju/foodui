import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/food/restaurantsCompactDetailCard.dart';
import 'package:provider/provider.dart';

import '../../const/urls.dart';
import '../../provider/foodMainScreenProvider.dart';
import '../../utils/helper.dart';
import '../../widgets/chipFilter.dart';
import '../../widgets/chipOption.dart';
import '../../widgets/offerCard.dart';
import '../../widgets/productCompactCard.dart';

class RestaurantListing extends StatefulWidget {
  RestaurantListing({super.key, this.isBottomSheet});
  bool? isBottomSheet;
  @override
  State<RestaurantListing> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<RestaurantListing> {
  @override
  Widget build(BuildContext context) {
    final foodController = Provider.of<FoodMainScreenProvider>(context);
    ScreenUtil.init(context);
    return Container(
     // height: 220.h,
      child: ListView(

        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          RestaurantCompactDetailCard(image:Helper.getAssetName("restaurant01.jpeg", "real") ,
          name: "Al Barsha Inasal Restaurant", foods: 'Lebanese, BreakFast, Desserts',restaurantId:2,),
          SizedBox(
            height: 12,
          ),
          RestaurantCompactDetailCard(image: "assets/images/real/restaurant02.jpeg",
          name: "Foods Sagar Restaurant", foods: 'American, BreakFast, Desserts',topchoice: true,ispro: true,restaurantId:2),
          SizedBox(
            height: 12,
          ),
          RestaurantCompactDetailCard(image: "assets/images/real/restaurant06.jpeg",
          name: "Dwsha Restaurant", foods: 'Arabian, BreakFast, Desserts',ispro: true,restaurantId:2),
          SizedBox(
            height: 12,
          ),
          RestaurantCompactDetailCard(image: "assets/images/real/restaurant05.jpeg",
              name: "Quinoa Restaurant", foods: 'Arabian, BreakFast, Desserts',restaurantId:2),
          SizedBox(
            height: 12,
          ),
          RestaurantCompactDetailCard(image: "assets/images/real/restaurant04.jpeg",
              name: "Fakhfakhina Restaurant", foods: 'Arabian, BreakFast, Desserts',ispro: true,restaurantId: 2)
        ],
      ),
    );
  }



}
