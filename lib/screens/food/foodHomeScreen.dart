import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/food/promotionScroller.dart';
import 'package:foodui/screens/food/restaurantsCompactDetailCard.dart';
import 'package:foodui/screens/food/restaurantsListing.dart';
import 'package:provider/provider.dart';

import '../../const/urls.dart';
import '../../provider/foodMainScreenProvider.dart';
import '../../utils/helper.dart';
import '../../widgets/deliverLocation.dart';
import '../../widgets/offerCard.dart';
import 'foodCompactScroller.dart';
import 'foodTopScrollChips.dart';

class FoodHomeScreen extends StatefulWidget {
  static const routeName = "/foodHomeScreen";

  const FoodHomeScreen({super.key});

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {


  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final foodController = Provider.of<FoodMainScreenProvider>(context);
ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 150,

        backgroundColor: Colors.white10,
        elevation: 0,
        //automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: (){Navigator.of(context).pop();},
            child: Icon(Icons.arrow_back,color: Colors.black45,size: 28.sp)),
        title: DeliverLocation(),
        actions: [Container(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.search_outlined,color: Colors.black45,size: 28.sp,))],
      ),
      body: Padding(

        padding: const EdgeInsets.only(left: 10).r,
        child: ListView(
          physics: ScrollPhysics(),
        //  shrinkWrap: true,
          children: [

            FoodTopScrollChips(),
            SizedBox(height: 15.w,),
            PromotionScroller(),
            SizedBox(height: 15.w,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 5, 12).r,
              child: Text("Great value deals",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.black87),),),
            FoodCompactScroller(),
            SizedBox(height: 15.w,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 5, 12).r,
              child: Text("All restaurants",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.black87),),),

            RestaurantListing(),
            SizedBox(height: 15.w,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 5, 12).r,
              child: Text("Trending Now",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.black87),),),
            FoodCompactScroller(),
            SizedBox(height: 15.w,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 5, 12).r,
              child: Text("Nearby restaurants",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.black87),),),

            RestaurantListing(),
          ],
        ),
      ),
    );
  }
}
