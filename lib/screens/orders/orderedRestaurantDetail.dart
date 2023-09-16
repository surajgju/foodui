
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class OrderdRestaurantDetails extends StatefulWidget {
  const OrderdRestaurantDetails({super.key});

  @override
  State<OrderdRestaurantDetails> createState() => _OrderdRestaurantDetailsState();
}

class _OrderdRestaurantDetailsState extends State<OrderdRestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return ConstrainedBox(
     // height: 80.h,
      constraints: BoxConstraints(maxHeight: 90.h,minHeight: 70.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 80,
              width: 80,
              child: Image.asset(
                Helper.getAssetName("hamburger.jpg", "real"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "King Burgers",
                style: Helper.getTheme(context).titleLarge,
              ),
              Row(
                children: [
                  Image.asset(
                    Helper.getAssetName(
                      "star_filled.png",
                      "virtual",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "4.9",
                    style: TextStyle(
                      color: AppColor.green,
                    ),
                  ),
                  Text(" (124 ratings)"),
                ],
              ),
              Row(
                children: [
                  Text("Burger",style: Helper.getTheme(context).titleSmall),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 2,
                    ).r,
                    child: Text(
                      ".",
                      style: TextStyle(
                        color: AppColor.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text("Western Food",style: Helper.getTheme(context).titleSmall),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 15.h,
                    child: Image.asset(
                      Helper.getAssetName(
                        "loc.png",
                        "virtual",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text("No 03, 4th Lane, Newyork",style: TextStyle(fontSize: 12),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
