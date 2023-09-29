import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/food/restaurantsCompactDetailCard.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../const/constant.dart';
import '../../modals/foods/food.dart';
import '../../provider/featuredRestaurantCategoriesProvider.dart';
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
  List<Foods> foodList = [
    Foods(
        food_name: "pastry",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        food_id: 2,
        img:
            "https://images.unsplash.com/photo-1628890444435-9e68e905773b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fHBhc3RyeXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60",
        food_type: "Indian",
        price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "Burger",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        food_id: 2,
        img:
            "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1065&q=80",
        food_type: "French",
        price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "pizza",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        food_id: 2,
        img:
            "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",
        food_type: "Italian",
        price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "Momos",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        food_id: 2,
        img:
            "https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW9tb3N8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",
        food_type: "Chinese",
        price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "Noodles",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        food_id: 2,
        img:
            "https://images.unsplash.com/photo-1612929633738-8fe44f7ec841?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bm9vZGxlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60",
        food_type: "Chinese",
        price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "Samosa",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        food_id: 2,
        img:
            "https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2Ftb3NhfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60",
        food_type: "Indian",
        price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
  ];
  List<String> foodIdList = [
    "2Pn7TxwYih0sVsPDfHFZ",
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
    "sQIJUSWuJDPbvEiAEKyU"
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final resCatProvider = Provider.of<FeaturedRestaurantCategoriesProvider>(context,listen: false);
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
            title: "Search foods",
              searchController: foodResCategoryProvider.searchString,
              onTap: (){
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
                      restaurantId:int.parse( foodResCategoryProvider.searchRestaurantByLocationList[index].id!),
                      name: foodResCategoryProvider.searchRestaurantByLocationList[index].brandName,
                      image: VENDOR_IMAGE_UPLOAD+ foodResCategoryProvider.searchRestaurantByLocationList[index].img1!,
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
                    Center(child: Container(child: Text("No Record Found"),))
        ],
      ),
    );
  }
}
