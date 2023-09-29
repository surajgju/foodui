import 'package:flutter/material.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/utils/helper.dart';
import 'package:provider/provider.dart';
import '../provider/featuredRestaurantCategoriesProvider.dart';

class SearchBar extends StatelessWidget {
  final String? title;
  VoidCallback onTap;
  TextEditingController? searchController;
  SearchBar({@required this.title,required this.onTap,this.searchController});
  @override
  Widget build(BuildContext context) {
    final foodCategoryProvider = Provider.of<FeaturedRestaurantCategoriesProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
         // shape: StadiumBorder(),
          color: AppColor.placeholderBg,
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextField(
          onChanged: (s){
             foodCategoryProvider.searchRestaurantByLocation();
          },
          //controller: foodCategoryProvider.searchString,
          controller: searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap:onTap,
              // onTap: (){
              // successToast("search");
              //   Navigator.of(context).pushNamed(SearchScreen.routeName);
              // },
              child: Image.asset(
                Helper.getAssetName("search_filled.png", "virtual",),
                color: AppColor.secondary,
              ),
            ),
            hintText: title,
            hintStyle: TextStyle(
               color: AppColor.secondary,
             // color: Colors.brown,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
            contentPadding: const EdgeInsets.only(
              top: 12,
              left: 15,
              right: 8
            ),
          ),
        ),
      ),
    );
  }
}
