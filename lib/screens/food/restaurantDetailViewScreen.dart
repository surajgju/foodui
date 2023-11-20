import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/screens/food/RestaurantDescriptionCard.dart';
import 'package:provider/provider.dart';
import '../../const/constant.dart';
import '../../provider/cart.dart';
import '../../provider/featuredRestaurantCategoriesProvider.dart';
import '../../provider/ordersProviders.dart';
import '../../utils/helper.dart';
import '../../widgets/orderItemsPopup.dart';
import '../orders/myOrderScreen.dart';
import 'foodCompactDetailCard.dart';

class RestaurantDetailViewScreen extends StatefulWidget {
  static const routeName = "/restaurantDetailViewScreen";

  RestaurantDetailViewScreen({super.key});

  @override
  State<RestaurantDetailViewScreen> createState() =>
      _RestaurantDetailViewScreenState();
}

class _RestaurantDetailViewScreenState
    extends State<RestaurantDetailViewScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      final provider =
      Provider.of<FeaturedRestaurantCategoriesProvider>(context,listen: false);

      if(args['restaurant_id'] != null) {
        provider.getRestaurantDetailById(args['restaurant_id']);
        provider.getRestaurantMenuById(args['restaurant_id']);
        provider.getMenuItemByRestaurantId(args['restaurant_id']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final cartProvider = Provider.of<Cart>(context);
    final orderProvider = Provider.of<Orders>(context);
    final restaurantCategoriesProvider = Provider.of<FeaturedRestaurantCategoriesProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              controller: _scrollController, slivers: [
            SliverAppBar(
              // key: Key("new"),
           //   pinned: false,
              //floating: false,
            //  snap: true,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 4).r,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black87,
                  ),
                ),
              ),
              // actions: [
              //   Container(
              //     padding: EdgeInsets.fromLTRB(8, 8, 8, 8).r,
              //     margin: EdgeInsets.only(right: 10),
              //     decoration: BoxDecoration(
              //         color: Colors.white, shape: BoxShape.circle),
              //     child: Icon(Icons.more_vert_outlined, color: Colors.black87),
              //   )
              // ],

              expandedHeight: 0.25.sh,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.asset(
                      "assets/images/real/western2.jpg",
                      height: 0.3.sh,
                      width: 1.sw,
                      fit: BoxFit.cover,
                    ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 70),
                    width: ScreenUtil().screenWidth*0.9,
                    height: 120.h,
                    child:restaurantCategoriesProvider.restaurant != null && restaurantCategoriesProvider.restaurant.id != null ? RestaurantDescriptionCard(
                        name : restaurantCategoriesProvider.restaurant.name?? "Restaurant Name",
                        image :restaurantCategoriesProvider.restaurant.img1 != null && restaurantCategoriesProvider.restaurant.img1!.isNotEmpty ? IMAGE_UPLOAD_URL+ restaurantCategoriesProvider.restaurant.img1! : IMAGE_UPLOAD_URL+( restaurantCategoriesProvider.restaurant.img2 ??""),
                        restaurantId : restaurantCategoriesProvider.restaurant.id!.toInt(),
                      foods: restaurantCategoriesProvider.restaurant.storeType,
                      location:  restaurantCategoriesProvider.restaurant.address,
                      deliveryFees: restaurantCategoriesProvider.restaurantDistanceMatrix.rows != null ?restaurantCategoriesProvider.restaurantDistanceMatrix.rows![0].elements![0].distance!.value!.toDouble() < 5000 ?25:restaurantCategoriesProvider.calculatePrice(restaurantCategoriesProvider.restaurantDistanceMatrix.rows![0].elements![0].distance!.value!.toDouble()):25.00,
                      deliveryTime: restaurantCategoriesProvider.restaurantDistanceMatrix.rows != null ?restaurantCategoriesProvider.restaurantDistanceMatrix.rows![0].elements![0].duration!.text:"15 Mins",
                      ):Center(child: CircularProgressIndicator()),
                  ),
                ),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Build the list of items
                return Container(
                  margin: EdgeInsets.only(left: 15, right: 10, top: 15 ),
                  child: FoodCompactDetailCard(
                    name: restaurantCategoriesProvider.restaurantMenuItems[index].productName,
                    image:restaurantCategoriesProvider.restaurantMenuItems[index].img != null ?IMAGE_UPLOAD_URL+  restaurantCategoriesProvider.restaurantMenuItems[index].img! :"",
                    foodId: restaurantCategoriesProvider.restaurantMenuItems[index].id.toString(),
                    foods: restaurantCategoriesProvider.restaurantMenuItems[index].mainCategory,
                    restaurantId:(ModalRoute.of(context)!.settings.arguments as Map)['restaurant_id'] ,
                    price: restaurantCategoriesProvider.restaurantMenuItems[index].price,
                    menuId: int.parse(restaurantCategoriesProvider.restaurantMenuItems[index].categoryId!),
                    food_description: restaurantCategoriesProvider.restaurantMenuItems[index].description,
                    restaurantDetails: restaurantCategoriesProvider.restaurant,
                  ),
                );
              },
             // childCount: foodList.length,
              childCount: restaurantCategoriesProvider.restaurantMenuItems!.length,
            ))
          ]),
          Visibility(
            visible: cartProvider.cartDetailVisibility,
            child: Container(
                width: 1.sw,
                height: 1.sh,
                margin: EdgeInsets.only(bottom: 52),
                color: Colors.black45,
                child: Align(
                  alignment: Alignment.bottomCenter, child:Wrap(children:[
                    Align(alignment: Alignment.center,child: GestureDetector(
                      onTap: (){
                        setState(() {
                          cartProvider.cartDetailVisibility = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                          child: Icon(Icons.close,color: Colors.white,)),
                    ),),
                  OrderItemsPopup()
                    // OrderItems()
                ]),
              ),
            ),
          ),
          if (cartProvider.cart.length > 0)
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  height: 50.h,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Helper.getAssetName("cart.png", "virtual"),
                          scale: 5,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                         setState(() {
                           cartProvider.cartDetailVisibility = !cartProvider.cartDetailVisibility;
                         });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, left: 5),
                          child: Row(
                            children: [
                              Text("${cartProvider.cart.length} ITEMS ADDED",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12)),
                              Icon(
                                Icons.arrow_drop_up_outlined,
                                color: AppColor.green,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(MyOrderScreen.routeName);
                        },
                        child: Container(
                          width: 130.w,
                          height: 35.h,
                          //   padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),

                          decoration: BoxDecoration(
                            color: AppColor.green,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Icon(
                                    Icons.arrow_right,
                                    size: 16.sp,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){},
      // ),
    ); // Number of items in the list
  }

  void _scrollToItem(int index,int occure) {
    // Calculate the height of each list item based on its index
    double itemHeight =
        127.0.h; // Change this value based on your list item's height
    double offset = index * itemHeight * occure;
    // Scroll to the desired position using animateTo
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  Widget chipOption({required chipText}) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        // color: Colors.red,
          border: Border.all(color: AppColor.textColor),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 2.w,
          ),
          Text(chipText!),
          SizedBox(
            width: 2.w,
          )
        ],
      ),
    );
  }
}
