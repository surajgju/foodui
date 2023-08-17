
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

    return SizedBox(
      height: 80.h,
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
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "King Burgers",
                style: Helper.getTheme(context).headline3,
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
                  Text("Burger"),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Text(
                      ".",
                      style: TextStyle(
                        color: AppColor.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text("Western Food"),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    child: Image.asset(
                      Helper.getAssetName(
                        "loc.png",
                        "virtual",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("No 03, 4th Lane, Newyork")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
