import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qconnect/const/constant.dart';
import 'package:qconnect/screens/food/restaurantsCompactDetailCard.dart';
import 'package:provider/provider.dart';
import '../../provider/featuredRestaurantCategoriesProvider.dart';
import '../../widgets/navigate_back_widget.dart';

class RestaurantListingScreen extends StatefulWidget {
  static const routeName = "/restaurantListing";

  RestaurantListingScreen({super.key, this.isBottomSheet});
  bool? isBottomSheet;
  @override
  State<RestaurantListingScreen> createState() =>
      _RestaurantListingScreenState();
}

class _RestaurantListingScreenState extends State<RestaurantListingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      final provider =
      Provider.of<FeaturedRestaurantCategoriesProvider>(context,listen: false);
      print(args);
      if(args['search_by'] != null) {if( args['search_by']=='food'){
        provider.restaurantCategories = [];
        provider.getRestaurantByCategories(args['category']);
      }
      if(args['search_by']=='food_item'){
         provider.restaurantCategories = [];
        provider.getRestaurantByFoodItem(args['category']);
      }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurantController = Provider.of<FeaturedRestaurantCategoriesProvider>(context);
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: back(context),
        title: Text("Restaurant Listing",style: TextStyle(color: Colors.black54,fontSize: 18.sp,fontWeight: FontWeight.w600),),
      ),
      body: Container(
       // margin: EdgeInsets.only(top: 10),
        child: restaurantController.restaurantCategories != null && restaurantController.restaurantCategories.isNotEmpty ?
        ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: restaurantController.restaurantCategories!.length,
            itemBuilder: (c,i){
              return  Container(
                padding: EdgeInsets.only(top: 10),
                child: RestaurantCompactDetailCard(
                        // image: Helper.getAssetName("restaurant01.jpeg", "real"),
                        image:IMAGE_UPLOAD_URL+ restaurantController.restaurantCategories![i].img1!,
                        name: restaurantController.restaurantCategories![i].restaurantName,
                        foods: restaurantController.restaurantCategories![i].storeType,
                        restaurantId:restaurantController.restaurantCategories![i].id!.toInt(),
                      ),
              );}):Center(child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Loading...")
                      ],
                    ),),

      ),
    );
  }
}
