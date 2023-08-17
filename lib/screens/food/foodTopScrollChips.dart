import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/foodMainScreenProvider.dart';
import '../../widgets/chipFilter.dart';
import '../../widgets/chipOption.dart';

class FoodTopScrollChips extends StatefulWidget {
  static const routeName = "/foodTopScrollChips";

  FoodTopScrollChips({super.key, this.isBottomSheet});
bool? isBottomSheet;
  @override
  State<FoodTopScrollChips> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodTopScrollChips> {
  @override
  Widget build(BuildContext context) {
    final foodController = Provider.of<FoodMainScreenProvider>(context);
    ScreenUtil.init(context);
    return Container(
      height: 35.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          ChipOption(chipText: "Short by",chipPrefix:Icons.sort,chipTrailing: Icons.keyboard_arrow_down_outlined,onTap: (){},),
          ChipOption(chipText: "Cuisines",chipPrefix: Icons.sort,chipTrailing: Icons.keyboard_arrow_down_outlined,onTap: (){},),
          ChipOption(chipText: "Rating 4.0+",chipPrefix: Icons.sort,chipTrailing: Icons.keyboard_arrow_down_outlined,onTap: (){},),
          ChipFilter(chipText: "Free Delivery",chipTrailing: Icons.clear,isEnabled:foodController.isFreeDeliveryEnable,onTap: (){setState(() {
            foodController.isFreeDeliveryEnable= !foodController.isFreeDeliveryEnable;
          });},),
          ChipFilter(chipText: "Under 30 mins",chipTrailing: Icons.clear,isEnabled:foodController.isUnderTenMinutesEnable,onTap: (){setState(() {
        foodController.isUnderTenMinutesEnable = !foodController.isUnderTenMinutesEnable;
          });},),
          ChipFilter(chipText: "Newly Added",chipTrailing: Icons.clear,isEnabled:foodController.isNewlyAddedEnable,onTap: (){setState(() {
            foodController.isNewlyAddedEnable = !foodController.isNewlyAddedEnable;
          });},),

        ],
   ),
    );
  }



}
