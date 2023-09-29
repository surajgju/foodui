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
      print(args);
      if(args['restaurant_id'] != null) {
        provider.getRestaurantDetailById(args['restaurant_id']);
        provider.getRestaurantMenuById(args['restaurant_id']);
        provider.getMenuItemByRestaurantId(args['restaurant_id']);
      }
      // if(args['food_item'] != null){
      //   provider.getRestaurantByFoodItem(args['food_item']);
      // }
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
              pinned: true,
              floating: true,
              snap: true,
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
              actions: [
                Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8).r,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(Icons.more_vert_outlined, color: Colors.black87),
                )
              ],

              expandedHeight: 0.40.sh,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.asset(
                      "assets/images/real/western2.jpg",
                      height: 0.28.sh,
                      width: 1.sw,
                      fit: BoxFit.cover,
                    ),
                Center(
                  child: SizedBox(
                    width: ScreenUtil().screenWidth*0.9,
                    height: 120,
                    child:restaurantCategoriesProvider.restaurant != null && restaurantCategoriesProvider.restaurant.id != null ? RestaurantDescriptionCard(
                        name : restaurantCategoriesProvider.restaurant.brandName?? "Restaurant Name",
                        image :restaurantCategoriesProvider.restaurant.img1 != null && restaurantCategoriesProvider.restaurant.img1!.isNotEmpty ? VENDOR_IMAGE_UPLOAD+ restaurantCategoriesProvider.restaurant.img1! : VENDOR_IMAGE_UPLOAD+( restaurantCategoriesProvider.restaurant.img2 ??""),
                        restaurantId : int.parse(restaurantCategoriesProvider.restaurant.id!),
                      foods: restaurantCategoriesProvider.restaurant.storeType,
                      location:  restaurantCategoriesProvider.restaurant.restaurantAddress,
                      ):Center(child: CircularProgressIndicator()),
                  ),
                ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(1.sw, 130.h),
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Container(
                     color: Colors.white,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              // padding: EdgeInsets.only(left: 10,right: 10),
                              child: Column(
                                children: [
                                  Text("Delivery fee",style: TextStyle(fontSize: 16,color: AppColor.textColor),),
                                  SizedBox(height: 5.h,), Text("6.50 \₹",style: TextStyle(fontSize: 17.sp,color: Colors.black87))
                                ],
                              ),
                            ),
                            Container(height: 45.h,width: 1.w,color: AppColor.placeholder,),
                            Flexible(
                              // padding: EdgeInsets.only(left: 10,right: 10),
                              child: Column(
                                children: [
                                  Text("Delivery time",style: TextStyle(fontSize: 16,color: AppColor.textColor),),
                                  SizedBox(height: 5.h,), Text("40 mins",style: TextStyle(fontSize: 17.sp,color: Colors.black87))
                                ],
                              ),
                            ), Container(height: 45.h,width: 1.w,color: AppColor.placeholder,),

                            Flexible(
                              // padding: EdgeInsets.only(left: 10,right: 10),
                              child: Column(
                                children: [
                                  Text("Delivered by",style: TextStyle(fontSize: 16,color: AppColor.textColor),),
                                  SizedBox(height: 5.h,),
                                  Text("Qconnect",style: TextStyle(fontSize: 17.sp,color: Colors.black87))
                                ],
                              ),
                            ),

                          ],),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          SizedBox(
                              width: 310.w,
                         child:   Container(
                           margin: EdgeInsets.only(top: 5),
                           height: 30.h,
                           width: 1.sw,
                           child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: restaurantCategoriesProvider.restaurantMenu.length,
                                  itemBuilder: (c, i) {
                                    return GestureDetector(
                                      onTap: (){
                                        _scrollToItem(i,restaurantCategoriesProvider.scrollItemMap[restaurantCategoriesProvider.restaurantMenuItems[i].categoryId!]!);
                                      },
                                      child: chipOption(
                                          chipText:restaurantCategoriesProvider.restaurantMenu[i].category),
                                    );
                                  }),
                         )
                          )],)
                      ],
                    ),
                  ),
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
                    // name: "Pizza",
                    name: restaurantCategoriesProvider.restaurantMenuItems[index].productName,
                    image:VENDOR_DASHBOARD_IMAGE+ restaurantCategoriesProvider.restaurantMenuItems[index].img!,
                    foodId: restaurantCategoriesProvider.restaurantMenuItems[index].id,
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
