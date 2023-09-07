import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/utils/helper.dart';

import '../screens/food/restaurantDetailViewScreen.dart';

class ProductCompactDetailCard extends StatelessWidget {
  ProductCompactDetailCard(
      {super.key,
      required this.productImage,
      required this.productTitle,
      required this.productSubtitle,
      this.productRating,
      this.productReviewCount,
      required this.onTap});
  String? productImage;
  String? productTitle;
  String? productSubtitle;
  String? productRating;
  String? productReviewCount;

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      margin: EdgeInsets.only(right: 14),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(RestaurantDetailViewScreen.routeName,arguments: {"restaurantId":"_restaurantId"});

        },
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    productImage!,
                    width: 175.w,
                    height: 130.h,
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              width: 180.w,
              padding: EdgeInsets.only(top: 8, bottom: 5),
              child: Text(productTitle!,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Helper.getTheme(context)
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 19)),
            ),
            Container(
              child: Text(productSubtitle!,
                  style: Helper.getTheme(context).bodySmall),
            ),
            if (productRating != null)
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xFFFFD700),
                      size: 20,
                    ),
                    Text(productRating!,
                        style: Helper.getTheme(context).titleMedium),
                    Text("($productReviewCount)",
                        style: Helper.getTheme(context)
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w300)),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
