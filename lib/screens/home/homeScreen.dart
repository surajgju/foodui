import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/food/offerHomeScreen.dart';
import 'package:foodui/screens/tracking/order_status.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../modals/foods/food.dart';
import '../../modals/restaurants/restaurant.dart';
import '../../provider/cart.dart';
import '../../provider/featuredCategoriesProvider.dart';
import '../../utils/helper.dart';
import '../../widgets/carousel1.dart';
import '../../widgets/categoryCard.dart';
import '../../widgets/compactCard1.dart';
import '../../widgets/compactCard2.dart';
import '../../widgets/customNavBar.dart';
import '../../widgets/orderItemsPopup.dart';
import '../../widgets/sliding_up_panel.dart';
import '../../widgets/temporary.dart';
import '../food/foodCompactScroller.dart';
import '../food/restaurantsListing.dart';
import '../food_categories/food_categories_card.dart';
import '../individualItem.dart';
import '../../widgets/deliverLocation.dart';
import '../../widgets/searchBar.dart';
import 'package:foodui/widgets/searchBar.dart' as sb;

import '../food/foodHomeScreen.dart';
import '../food_categories/menuScreen.dart';
import '../moreScreen.dart';
import '../orders/myOrderScreen.dart';
import '../tracking/locationTracking.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Restaurants> restaurantDetails = [
    Restaurants(
        rest_name: "restaurent 1",
        rest_owner_name: "owner name",
        rest_owner_number: "+91 8168673754",
        rest_description:
            "restaurant description in datail. Fast food available",
        rest_address: "16 street, park avenue, New york,USA",
        rest_opening_hrs: "9:30 AM - 12:30 AM",
        rest_delivery_time: "30 min",
        rest_minimum_order: "1",
        rest_rating: "2.5",
        cuisines_id: "2,4",
        rest_menu_images: [
          "https://images.unsplash.com/photo-1552566626-52f8b828add9"
        ]),
    Restaurants(
        rest_name: "restaurent 2",
        rest_owner_name: "owner name",
        rest_owner_number: "+91 8168673754",
        rest_description:
            "restaurant description in datail. Fast food available",
        rest_address: "16 street, park avenue, New york,USA",
        rest_opening_hrs: "9:30 AM - 12:30 AM",
        rest_delivery_time: "30 min",
        rest_minimum_order: "1",
        rest_rating: "2.5",
        cuisines_id: "2,4",
        rest_menu_images: [
          "https://images.unsplash.com/photo-1613946069412-38f7f1ff0b65"
        ]),
    Restaurants(
        rest_name: "restaurent 3",
        rest_owner_name: "owner name",
        rest_owner_number: "+91 8168673754",
        rest_description:
            "restaurant description in datail. Fast food available",
        rest_address: "16 street, park avenue, New york,USA",
        rest_opening_hrs: "9:30 AM - 12:30 AM",
        rest_delivery_time: "30 min",
        rest_minimum_order: "1",
        rest_rating: "2.5",
        cuisines_id: "2,4",
        rest_menu_images: [
          "https://images.unsplash.com/photo-1525648199074-cee30ba79a4a"
        ]),
    Restaurants(
        rest_name: "restaurent 4",
        rest_owner_name: "owner name",
        rest_owner_number: "+91 8168673754",
        rest_description:
            "restaurant description in datail. Fast food available",
        rest_address: "16 street, park avenue, New york,USA",
        rest_opening_hrs: "9:30 AM - 12:30 AM",
        rest_delivery_time: "30 min",
        rest_minimum_order: "1",
        rest_rating: "2.5",
        cuisines_id: "2,4",
        rest_menu_images: [
          "https://images.unsplash.com/photo-1585518419759-7fe2e0fbf8a6"
        ]),
    Restaurants(
        rest_name: "restaurent 5",
        rest_owner_name: "owner name",
        rest_owner_number: "+91 8168673754",
        rest_description:
            "restaurant description in datail. Fast food available",
        rest_address: "16 street, park avenue, New york,USA",
        rest_opening_hrs: "9:30 AM - 12:30 AM",
        rest_delivery_time: "30 min",
        rest_minimum_order: "1",
        rest_rating: "2.5",
        cuisines_id: "2,4",
        rest_menu_images: [
          "https://images.unsplash.com/photo-1544148103-0773bf10d330"
        ]),
    Restaurants(
        rest_name: "restaurent 6",
        rest_owner_name: "owner name",
        rest_owner_number: "+91 8168673754",
        rest_description:
            "restaurant description in datail. Fast food available",
        rest_address: "16 street, park avenue, New york,USA",
        rest_opening_hrs: "9:30 AM - 12:30 AM",
        rest_delivery_time: "30 min",
        rest_minimum_order: "1",
        rest_rating: "2.5",
        cuisines_id: "2,4",
        rest_menu_images: [
          "https://images.unsplash.com/photo-1623800330578-2cd67efaec75"
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    final featuredCategoriesProvider =
        Provider.of<FeaturedCategoriesProvider>(context);
    final cartProvider = Provider.of<Cart>(context);

    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 15).r,
                        child: GestureDetector(
                            onTap: (){
                             // Navigator.pushNamed(context, MyMaps.routeName);
                            },
                            child: DeliverLocation())),SizedBox(width: 20.w,),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, OrderStatus.routeName);
                         //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SlidingUpPanelExample()));
                        },
                        child: Image.asset("assets/images/virtual/logo.png",color:AppColor.green,width: 100.w,)),
                    SizedBox(width: 42.w,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(MyOrderScreen.routeName);
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 0, right: 0).r,
                                child: Image.asset(
                                  Helper.getAssetName("cart.png", "virtual"),
                                  scale: 4,
                                ),
                              ),
                              if (cartProvider.cart.length > 0)
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 20.w,
                                    height: 15.h,
                                    padding:
                                        EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Text(
                                        cartProvider.cart.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 9),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(MoreScreen.routeName);
                          },
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            margin: EdgeInsets.only(top: 3),
                            padding: EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
                            decoration: BoxDecoration(
                                color: AppColor.darkShade1,
                                shape: BoxShape.circle,
                                //borderRadius: BorderRadius.circular(50)
                                border: Border.all(
                                    color: Colors.black54, width: 0.2.w)),
                            child: Image.asset(
                              Helper.getAssetName("user.png", "virtual"),
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              sb.SearchBar(
                title: "Search foods",
              ),SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  width: 0.975.sw,
                  child: CarouselOne()),
              SizedBox(
                height: 25.h,
              ),
              // Divider(color: Colors.grey,
              //   thickness: 0.5,
              //   height: 30.h,
              //   indent: 20,
              //   endIndent: 20,
              // ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10, right: 10).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CategoryCard(
                        image: Image.asset(
                          Helper.getAssetName(
                              "last_minute_offer.png", "virtual"),
                          height: 100.h,
                           width: 80.w,
                          fit: BoxFit.cover,
                        ),
                        name: "Offer Zone",
                        onTap: () {
                          Navigator.pushNamed(
                              context, OfferHomeScreen.routeName);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),

                    Flexible(
                      child: CategoryCard(
                        image: Image.asset(
                          Helper.getAssetName("grocery.png", "real"),
                          height: 100.h,
                          width: 80.w,
                          fit: BoxFit.cover,
                        ),
                        name: "Premium",
                        onTap: () {
                          //  print("gggggg");
                          Navigator.pushNamed(
                              context, FoodHomeScreen.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // SizedBox(
              //   height: 20.h,
              // ),
              Container(
                width: 0.975.sw,
                padding: const EdgeInsets.only(left: 10,bottom: 10).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Categories",
                      style: Helper.getTheme(context).titleLarge!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),Spacer(),
                    TextButton(
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MenuScreen()));
                      },
                      child: Text("View all",style: TextStyle(color: AppColor.secondary),),
                    ),
                  ],
                ),
              ),
          SizedBox(
            height: 250.h,
              width: 1.sw,
              child:FoodCategoriesCard()),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 5, 8).r,
                child: Text(
                  "Top rated for you ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
              Container(
                  height: 170.h,
                 // width: double.infinity,
                  width: 0.975.sw,
                  padding: const EdgeInsets.only(left: 10, top: 10).r,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredCategoriesProvider.foodCategory.length,
                      itemBuilder: (c, i) {
                        String food_id = featuredCategoriesProvider
                            .foodCategory[i]!.food_id!;
                        Foods foods = Foods();
                        foods = featuredCategoriesProvider
                            .foodCategoryFoods[food_id]!;
                        return Row(
                          children: [
                            CompactCard2(
                              image: foods.food_images![0],
                              name: foods.food_name,
                              imageTitle: featuredCategoriesProvider
                                      .foodCategory[i].offer_price!.isNotEmpty
                                  ? featuredCategoriesProvider
                                          .foodCategory[i].offer_price! +
                                      " OFF"
                                  : featuredCategoriesProvider
                                          .foodCategory[i].offer_percentage! +
                                      "% OFF",
                              imageSubTitle: "ABOVE 200",
                              orderTime: "40 min",
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        );
                      })),
              SizedBox(
                height: 15.w,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 5, 12).r,
                  child: Text(
                    "Great value deals",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ),
              ),
              Container(
                width: 0.975.sw,
                padding: EdgeInsets.fromLTRB(10, 5, 0, 12).r,
                child: FoodCompactScroller(),
              ),
              Container(
                width: 0.975.sw,
                padding: EdgeInsets.fromLTRB(10, 10, 5, 8).r,
                child: Text(
                  "Featured for you ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
              Container(
                  height: 170.h,
                  //color: Colors.red,
                  //width: double.infinity,
                  width: 0.975.sw,
                  padding: const EdgeInsets.only(left: 10, top: 10).r,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          featuredCategoriesProvider.foodCategory2.length,
                      itemBuilder: (c, i) {
                        String food_id = featuredCategoriesProvider
                            .foodCategory2[i]!.food_id!;
                        Foods foods = Foods();
                        foods = featuredCategoriesProvider
                            .foodCategoryFoods2[food_id]!;
                        return Row(
                          children: [
                            CompactCard2(
                              image: foods.food_images![0],
                              name: foods.food_name,
                              imageTitle: featuredCategoriesProvider
                                      .foodCategory2[i].offer_price!.isNotEmpty
                                  ? featuredCategoriesProvider
                                          .foodCategory2[i].offer_price! +
                                      " OFF"
                                  : featuredCategoriesProvider
                                          .foodCategory2[i].offer_percentage! +
                                      "% OFF",
                              imageSubTitle: "ABOVE 200",
                              orderTime: "40 min",
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        );
                      })),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Restaurants",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    TextButton(onPressed: () {}, child: Text("View all"))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RestaurantListing(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Restaurants",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    TextButton(onPressed: () {}, child: Text("View all"))
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              RestaurantCard(
                image: Image.asset(
                  Helper.getAssetName("pizza2.jpg", "real"),
                  fit: BoxFit.cover,
                ),
                name: "Minute by tuk tuk",
              ),
              RestaurantCard(
                image: Image.asset(
                  Helper.getAssetName("breakfast.jpg", "real"),
                  fit: BoxFit.cover,
                ),
                name: "Cafe de Noir",
              ),
              RestaurantCard(
                image: Image.asset(
                  Helper.getAssetName("bakery.jpg", "real"),
                  fit: BoxFit.cover,
                ),
                name: "Bakes by Tella",
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                width: 0.975.sw,
                padding: const EdgeInsets.symmetric(horizontal: 10.0).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular",
                      style: Helper.getTheme(context).headline5,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("View all",style: TextStyle(color: AppColor.secondary),),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 260.h,
                width: 0.975.sw,
               // width: double.infinity,
                padding: const EdgeInsets.only(left: 10).r,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CompactCard1(
                        image: Image.asset(
                          Helper.getAssetName("pizza4.jpg", "real"),
                          fit: BoxFit.cover,
                        ),
                        name: "Cafe De Bambaa",
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CompactCard1(
                        name: "Burger by Bella",
                        image: Image.asset(
                          Helper.getAssetName("dessert3.jpg", "real"),
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Items",
                      style: Helper.getTheme(context).headlineSmall,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("View all"),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ).r,
                height: 380.h,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: RecentItemCard(
                        image: Image.asset(
                          Helper.getAssetName("pizza3.jpg", "real"),
                          fit: BoxFit.cover,
                        ),
                        name: "Mulberry Pizza by Josh",
                      ),
                    ),
                    RecentItemCard(
                        image: Image.asset(
                          Helper.getAssetName("coffee.jpg", "real"),
                          fit: BoxFit.cover,
                        ),
                        name: "Barita"),
                    RecentItemCard(
                        image: Image.asset(
                          Helper.getAssetName("pizza.jpg", "real"),
                          fit: BoxFit.cover,
                        ),
                        name: "Pizza Rush Hour"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

   );
  }
}

class RecentItemCard extends StatelessWidget {
  const RecentItemCard({
    Key? key,
    @required String? name,
    @required Image? image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String? _name;
  final Image? _image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 80.w,
            height: 80.h,
            child: _image,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Container(
            height: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name!,
                  style: Helper.getTheme(context)
                      .headlineSmall
                      ?.copyWith(color: AppColor.primary),
                ),
                Row(
                  children: [
                    Text("Cafe"),
                    SizedBox(
                      width: 5.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.green,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text("Western Food"),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.green,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text('(124) Ratings')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    @required String? name,
    @required Image? image,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String? _name;
  final Image? _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200.h, width: double.infinity, child: _image),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ).r,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _name!,
                      style: Helper.getTheme(context).titleLarge,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.green,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text("(124 ratings)"),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text("Cafe"),
                    SizedBox(
                      width: 5.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.green,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text("Western Food"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
