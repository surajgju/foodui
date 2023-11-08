import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/food/restaurantsCompactDetailCard.dart';
import 'package:provider/provider.dart';
import '../../const/constant.dart';
import '../../provider/featuredCategoriesProvider.dart';
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
    final foodResController = Provider.of<FeaturedCategoriesProvider>(context);
    ScreenUtil.init(context);
    return foodResController.PopularRestaurantCategories != null && foodResController.PopularRestaurantCategories.length>0? Container(
     // height: 220.h,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: foodResController.PopularRestaurantCategories.length,//5,
        itemBuilder:(c,i) {

         return RestaurantCompactDetailCard(
            image:foodResController.PopularRestaurantCategories[i].img1 != null? IMAGE_UPLOAD_URL+ foodResController.PopularRestaurantCategories[i].img1! : "",
            name: foodResController.PopularRestaurantCategories[i].name ?? "restaurant name",
            foods: foodResController.PopularRestaurantCategories[i].storeType,
            restaurantId: foodResController.PopularRestaurantCategories[i].id!.toInt(),);
        },
      ),
    ):Container(child: Center(child: Text("Category not found"),),);
  }



}
