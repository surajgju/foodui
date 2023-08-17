// // import 'package:clip_shadow/clip_shadow.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../const/colors.dart';
// import '../screens/food/offerHomeScreen.dart';
// import '../screens/home/homeScreen.dart';
// import '../screens/menuScreen.dart';
// import '../screens/moreScreen.dart';
// import '../screens/orders/myOrderScreen.dart';
// import '../screens/offers/offersMainHomeScreen.dart';
// import '../screens/auth/profileScreen.dart';
// import '../utils/helper.dart';
//
// class CustomNavBar extends StatelessWidget {
//   final bool home;
//   final bool menu;
//   final bool offer;
//   final bool orders;
//   final bool more;
//
//   const CustomNavBar(
//       {Key? key,
//       this.home = false,
//       this.menu = false,
//       this.offer = false,
//       this.orders = false,
//       this.more = false})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context);
//     return SizedBox(
//       height: 100.h,
//       width: Helper.getScreenWidth(context),
//       child: Stack(
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ClipPath(
//
//                clipper: CustomNavBarClipper(),
//               child: Container(
//                 height: 70.h,
//                 width: Helper.getScreenWidth(context),
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         if (!menu) {
//                           // Navigator.of(context)
//                           //     .pushReplacementNamed(MenuScreen.routeName);
//                         }
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           menu
//                               ? Image.asset(
//                                   Helper.getAssetName(
//                                       "more_filled.png", "virtual"),
//                                 )
//                               : Image.asset(
//                                   Helper.getAssetName("more.png", "virtual"),
//                                 ),
//                           menu
//                               ? Text("Menu",
//                                   style: TextStyle(color: AppColor.green))
//                               : Text("Menu"),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         if (!offer) {
//                           // Navigator.pushReplacementNamed(
//                           //     context, OfferMainHomeScreen.routeName);
//                         }
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           offer
//                               ? Image.asset(
//                                   Helper.getAssetName(
//                                       "bag_filled.png", "virtual"),
//                                 )
//                               : Image.asset(
//                                   Helper.getAssetName("bag.png", "virtual"),
//                                 ),
//                           offer
//                               ? Text("Offers",
//                                   style: TextStyle(color: AppColor.green))
//                               : Text("Offers"),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         if (!orders) {
//                           Navigator.of(context)
//                               .pushReplacementNamed(MyOrderScreen.routeName);
//
//                         }
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           orders
//                               ? Image.asset(
//                                   Helper.getAssetName(
//                                       "orders_filled.png", "virtual"),
//                                 )
//                               : Image.asset(
//                                   Helper.getAssetName("orders.png", "virtual"),
//                                 ),
//                           orders
//                               ? Text("Orders",
//                                   style: TextStyle(color: AppColor.green))
//                               : Text("Orders"),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         if (!more) {
//                           Navigator.of(context)
//                               .pushReplacementNamed(MoreScreen.routeName);
//                         }
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           more
//                               ? Image.asset(
//                                   Helper.getAssetName(
//                                       "menu_filled.png", "virtual"),
//                                 )
//                               : Image.asset(
//                                   Helper.getAssetName("menu.png", "virtual"),
//                                 ),
//                           more
//                               ? Text("More",
//                                   style: TextStyle(color: AppColor.green))
//                               : Text("More"),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: SizedBox(
//               height: 70.h,
//               width: 70.w,
//               child: FloatingActionButton(
//                 elevation: 0,
//                 backgroundColor: home ? AppColor.placeholderBg : AppColor.placeholderBg,
//                 onPressed: () {
//                   if (!home) {
//                     Navigator.of(context)
//                         .pushReplacementNamed(HomeScreen.routeName);
//                   }
//                 },
//                 child:
//                 home?Image.asset(
//                     Helper.getAssetName("home_filled.png", "virtual"),fit: BoxFit.fill,):
//                 Image.asset(
//                     Helper.getAssetName("home_white.png", "virtual")),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class CustomNavBarClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(size.width * 0.3, 0);
//     path.quadraticBezierTo(
//       size.width * 0.375,
//       0,
//       size.width * 0.375,
//       size.height * 0.1,
//     );
//     path.cubicTo(
//       size.width * 0.416,
//       size.height * 0.9,
//       size.width * 0.59,
//       size.height * 0.9,
//       size.width * 0.625,
//       size.height * 0.1,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.625,
//       0,
//       size.width * 0.7,
//       0.1,
//     );
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.lineTo(0, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
