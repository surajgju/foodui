import 'package:flutter/material.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/utils/helper.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:provider/provider.dart';

import '../provider/searchProvider.dart';
import '../screens/search/search_screen.dart';

class SearchBar extends StatelessWidget {
  final String? title;
  SearchBar({@required this.title});
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
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
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: (){
                // successToast("search");
                Navigator.of(context).pushNamed(SearchScreen.routeName);
              },
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
