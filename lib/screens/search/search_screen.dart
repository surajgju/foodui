import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../modals/foods/food.dart';
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
        cuisines_id: "2,1",
        food_images: [
          "https://images.unsplash.com/photo-1628890444435-9e68e905773b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fHBhc3RyeXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60"
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
          "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1065&q=80"
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
          "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60"
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
          "https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW9tb3N8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60"
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
          "https://images.unsplash.com/photo-1612929633738-8fe44f7ec841?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bm9vZGxlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60"
        ],
        food_type: "Chinese",
        food_price: "23",
        food_reviews_id: "snFdsEFEnjsds"),
    Foods(
        food_name: "Samosa",
        food_description: "delicious taste and sugar free",
        food_minimum_order: "1",
        food_rating: "4.8",
        cuisines_id: "2,1",
        food_images: [
          "https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2Ftb3NhfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60"
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
    return Scaffold(
      appBar: AppBar(
        leading:  back(context),
        title: Text("Search for dishes & restaurants",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.textColor,fontSize: 14),),
      ),
      body: ListView(children: [
        sb.SearchBar(
          title: "Search foods",
        ),
        ...List.generate(5, (index) => Container(
          margin: EdgeInsets.only(left: 15, right: 10, top: 15 ),
          child: FoodCompactDetailCard(
            // name: "Pizza",
            name: foodList[index].food_name,
            image: foodList[index].food_images![0],
            foodId: foodIdList[index],
            foods: "Arabian,Indian,Americal",
          ),
        ))
      ],),
    );
  }
}
