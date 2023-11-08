import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/food/restaurantsCompactDetailCard.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../const/constant.dart';
import '../../modals/foods/food.dart';
import '../../provider/featuredRestaurantCategoriesProvider.dart';
import '../../provider/homeScreenProvider.dart';
import '../../widgets/navigate_back_widget.dart';
import '../food/foodCompactDetailCard.dart';
import 'package:foodui/widgets/searchBar.dart' as sb;

class SearchScreen extends StatefulWidget {
  static const routeName = "/searchScreen";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      final resCatProvider = Provider.of<FeaturedRestaurantCategoriesProvider>(context,listen: false);
      setState(() {
        resCatProvider.searchString.text = Provider.of<HomeScreenProvider>(context,listen:false).placemarks![0].locality!;
      });
      if(resCatProvider.searchString.text.isNotEmpty){
        resCatProvider.searchRestaurantByLocationList=[];
        resCatProvider.searchRestaurantByLocation();
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final foodResCategoryProvider = Provider.of<FeaturedRestaurantCategoriesProvider>(context);
    final homeProvider = Provider.of<HomeScreenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: back(context),
        title: Text(
          "Search for dishes & restaurants",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColor.textColor, fontSize: 14),
        ),
      ),
      body: ListView(
        children: [
          sb.SearchBar(
              title: homeProvider.placemarks != null ? homeProvider.placemarks![0].locality : "Search Foods By Location",

             // title: "Search foods",
              searchController: foodResCategoryProvider.searchString,
              onTap: (){
                print(foodResCategoryProvider.searchString.text);

                foodResCategoryProvider.searchRestaurantByLocation();
                setState(() {
                });
              }
          ),if(foodResCategoryProvider.searchRestaurantByLocationList.isNotEmpty)
          ...List.generate(
              foodResCategoryProvider.searchRestaurantByLocationList.length,
              (index) => Container(
                    margin: EdgeInsets.only(left: 15, right: 10, top: 15),
                    child: RestaurantCompactDetailCard(
                      restaurantId: foodResCategoryProvider.searchRestaurantByLocationList[index].id!.toInt(),
                      name: foodResCategoryProvider.searchRestaurantByLocationList[index].name,
                      image:foodResCategoryProvider.searchRestaurantByLocationList[index].img1 != null? IMAGE_UPLOAD_URL+ foodResCategoryProvider.searchRestaurantByLocationList[index].img1!:"",
                      foods: foodResCategoryProvider.searchRestaurantByLocationList[index].storeType,

                    ),
                    // child: FoodCompactDetailCard(
                    //   // name: "Pizza",
                    //   name: foodResCategoryProvider.searchRestaurantByLocationList[index].brandName,
                    //   image:VENDOR_IMAGE_UPLOAD+ foodResCategoryProvider.searchRestaurantByLocationList[index].img1!,
                    //   foodId: foodResCategoryProvider.searchRestaurantByLocationList[index].id,
                    //   foods: foodResCategoryProvider.searchRestaurantByLocationList[index].storeType,
                    //   restaurantId: 4,
                    // ),
                  ))else
                    Center(child: Container(child: Text("No Restaurant Found"),))
        ],
      ),
    );
  }
}
