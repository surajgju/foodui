import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/featuredRestaurantCategoriesProvider.dart';
import '../../utils/helper.dart';
import '../../widgets/chipFilter.dart';
import '../../widgets/chipOption.dart';
import '../../widgets/offerCard.dart';

class PromotionScroller extends StatefulWidget {
  static const routeName = "/foodTopScrollChips";

  PromotionScroller({super.key, this.isBottomSheet});
  bool? isBottomSheet;
  @override
  State<PromotionScroller> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<PromotionScroller> {
  @override
  Widget build(BuildContext context) {
    final foodController = Provider.of<FeaturedRestaurantCategoriesProvider>(context);
    ScreenUtil.init(context);
    return Container(
      height: 150.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          OfferCard(
            image: Image.asset(Helper.getAssetName("last_minute_offer.png", "virtual")),
            name: "Super Saver",
            onTap: (){},
          ),
          OfferCard(
            image: Image.asset(Helper.getAssetName("off_50.png", "virtual")),
            name: "Best Sellers",
            onTap: (){},
          ),
          OfferCard(
            image: Image.asset(Helper.getAssetName("last_minute_offer.png", "virtual")),
            name: "qconnect Pro",
            onTap: (){},
          ),
          OfferCard(
            image: Image.asset(Helper.getAssetName("off_50.png", "virtual")),
            name: "Summer Deals",
            onTap: (){},
          ),
          OfferCard(
            image: Image.asset(Helper.getAssetName("off_50.png", "virtual")),
            name: "Only on Qconnect",
            onTap: (){},
          ),
          OfferCard(
            image: Image.asset(Helper.getAssetName("last_minute_offer.png", "virtual")),
            name: "Coffee joy",
            onTap: (){},
          ),
          OfferCard(
            image: Image.asset(Helper.getAssetName("off_50.png", "virtual")),
            name: "Summer Deals",
            onTap: (){},
          ),
          OfferCard(
            image: Image.asset(Helper.getAssetName("last_minute_offer.png", "virtual")),
            name: "Top Choice",
            onTap: (){},
          ),
          OfferCard(
            image: Image.asset(Helper.getAssetName("off_50.png", "virtual")),
            name: "Desserts",
            onTap: (){},
          ),
          OfferCard(
            image: Image.asset(Helper.getAssetName("last_minute_offer.png", "virtual")),
            name: "Healthy",
            onTap: (){},
          ),
          OfferCard(
            image: Image.asset(Helper.getAssetName("off_50.png", "virtual")),
            name: "Give back",
            onTap: (){},
          )

        ],
      ),
    );
  }



}
