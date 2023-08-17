// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:foodui/const/colors.dart';
// import 'package:foodui/screens/food/promotionScroller.dart';
// import 'package:foodui/screens/food/restaurantsCompactDetailCard.dart';
// import 'package:foodui/screens/food/restaurantsListing.dart';
// import 'package:provider/provider.dart';
//
// import '../../const/urls.dart';
// import '../../provider/foodMainScreenProvider.dart';
// import '../../utils/helper.dart';
// import '../../widgets/compactCard2.dart';
// import '../../widgets/compactCard3.dart';
// import '../../widgets/customNavBar.dart';
// import '../../widgets/deliverLocation.dart';
// import '../../widgets/offerCard.dart';
// import '../food/foodCompactScroller.dart';
// import '../home/homeScreen.dart';
//
//
// class OfferMainHomeScreen extends StatefulWidget {
//   static const routeName = "/offerMainHomeScreen";
//
//   const OfferMainHomeScreen({super.key});
//
//   @override
//   State<OfferMainHomeScreen> createState() => _FoodHomeScreenState();
// }
//
// class _FoodHomeScreenState extends State<OfferMainHomeScreen> {
//
//
//   @override
//   void initState() {
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final foodController = Provider.of<FoodMainScreenProvider>(context);
//     ScreenUtil.init(context);
//     return Scaffold(
//
//       body: Stack(
//         children: [
//           CustomScrollView(
//             shrinkWrap: true,
//             physics: ScrollPhysics(),
//             slivers: [
//               SliverAppBar(
//
//                 backgroundColor: AppColor.placeholderBg,
//                // leadingWidth: 40.w,
//                 leading: Container(),
//                 // leading: GestureDetector(
//                 //     onTap: (){Navigator.of(context).pop();},
//                 //     child: Container(
//                 //         padding: EdgeInsets.fromLTRB(6, 8, 8, 8).r,
//                 //         margin: EdgeInsets.only(right: 5),
//                 //         decoration: BoxDecoration(
//                 //             color: Colors.black45, shape: BoxShape.circle),
//                 //         child: Icon(Icons.arrow_back,color: Colors.white,size: 22.sp))),
//                 actions: [Container(
//                     padding: EdgeInsets.fromLTRB(8, 8, 8, 8).r,
//                     margin: EdgeInsets.only(right: 10),
//                     decoration: BoxDecoration(
//                         color: Colors.black45, shape: BoxShape.circle),
//
//                     child: Icon(Icons.search_outlined,color: Colors.white,size: 22.sp,))],
//                 expandedHeight: 200,
//                 flexibleSpace: FlexibleSpaceBar(
//
//                   background: Container(
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
//                         child: Image.asset("assets/images/real/food-offer.jpg",fit: BoxFit.fill,)),
//                   ),
//                 ),
//               ),
//
//               SliverList(
//                 delegate: SliverChildListDelegate([
//                   Container(
//                     padding: EdgeInsets.fromLTRB(0, 10, 5, 8).r,
//
//                     child: Center(
//                       child: Text("✧    TOP OFFERS FOR YOU    ✧ ",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: Colors.black87),),),
//                   ),
//
//                   Container(
//                     height: 170.h,
//                     //color: Colors.red,
//                     width: double.infinity,
//                     padding: const EdgeInsets.only(left: 10,top: 10).r,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           CompactCard2(
//                             image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
//                             name: "Cafe De Bambaa",
//                             imageTitle:"120 OFF" ,
//                             imageSubTitle: "ABOVE 200",
//                             orderTime: "40 min",
//                           ),
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           CompactCard2(
//                             name: "Burger by Bella",
//                             image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
//                             imageTitle:"120 OFF" ,
//                             imageSubTitle: "UPTO 200",
//                             orderTime: "40 min",
//                           ),
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           CompactCard2(
//                             name: "Burger by Bella",
//                             image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
//                             imageTitle:"120 OFF" ,
//                             imageSubTitle: "UPTO 200",
//                             orderTime: "40 min",
//                           ),
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           CompactCard2(
//                             name: "Burger by Bella",
//                             image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
//                             imageTitle:"120 OFF" ,
//                             imageSubTitle: "ABOVE 200",
//                             orderTime: "40 min",
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: 15.w,),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(10, 5, 5, 12).r,
//                     child: Text("Great value deals",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.black87),),),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(10, 5, 5, 12).r,
//                     child: FoodCompactScroller(),
//                   ),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(0, 5, 5, 12).r,
//                     child: Text("Nearby restaurants",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.black87),),),
//
//                   ...List.generate(5, (index) => Padding(
//                     padding: const EdgeInsets.only(left: 10,top: 5).r,
//                     child: CompactCard3(
//                       id:3,
//                       image: "assets/images/real/western2.jpg",
//                       foods: "North Indian, Chinese Snacks",
//                       name: "Park Century",
//
//                     ),
//                   ))
//
//                 ]),
//               )
//             ],
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             child: CustomNavBar(
//               offer: true,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
