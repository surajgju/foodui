import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../provider/featuredRestaurantCategoriesProvider.dart';
import '../../widgets/chipFilter.dart';
import '../../widgets/chipOption.dart';

class FoodMenuScroller extends StatefulWidget {
  static const routeName = "/foodTopScrollChips";

  FoodMenuScroller({super.key, this.onTap});
  VoidCallback? onTap;
  @override
  State<FoodMenuScroller> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodMenuScroller> {

  @override
  Widget build(BuildContext context) {
    final resCategoriesProvider =
        Provider.of<FeaturedRestaurantCategoriesProvider>(context);
    ScreenUtil.init(context);
    return Container(

     // child:,
    );
  }


}
