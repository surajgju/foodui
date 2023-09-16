import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/foodMainScreenProvider.dart';
import '../../utils/helper.dart';
import '../../widgets/chipFilter.dart';
import '../../widgets/chipOption.dart';
import '../../widgets/offerCard.dart';
import '../../widgets/productCompactCard.dart';

class FoodCompactScroller extends StatefulWidget {
  static const routeName = "/foodCompactScroller";

  FoodCompactScroller({super.key, this.isBottomSheet});
  bool? isBottomSheet;
  @override
  State<FoodCompactScroller> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodCompactScroller> {

  @override
  Widget build(BuildContext context) {
    final foodController = Provider.of<FoodMainScreenProvider>(context);
    ScreenUtil.init(context);
    return Container(
      height: 210.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          ProductCompactDetailCard(
            productImage: "assets/images/real/western2.jpg",
            productTitle: "La Maison Du Cuisine delicious",
            productSubtitle: "Moroccan, Arabic",
            productRating: "3.3",
            productReviewCount: "100+",
            onTap: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyCustomScrollView()));
            },
          ),
          ProductCompactDetailCard(
            productImage: "assets/images/real/dessert2.jpg",
            productTitle: "Sweet Dessert",
            productSubtitle: "Moroccan, Arabic",
            productRating: "3.3",
            productReviewCount: "100+",
            onTap: (){},
          ),
          ProductCompactDetailCard(
            productImage: "assets/images/real/dessert4.jpg",
            productTitle: "La Maison Du Cuisine delicious",
            productSubtitle: "Moroccan, Arabic",
            productRating: "3.3",
            productReviewCount: "100+",
            onTap: (){},
          ),
          ProductCompactDetailCard(
            productImage: "assets/images/real/western2.jpg",
            productTitle: "La Maison Du Cuisine delicious",
            productSubtitle: "Moroccan, Arabic",
            productRating: "3.3",
            productReviewCount: "100+",
            onTap: (){},
          ),
          ProductCompactDetailCard(
            productImage: "assets/images/real/western2.jpg",
            productTitle: "La Maison Du Cuisine delicious",
            productSubtitle: "Moroccan, Arabic",
            productRating: "3.3",
            productReviewCount: "100+",
            onTap: (){},
          ),
        ],
      ),
    );
  }



}
