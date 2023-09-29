// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../screens/food/RestaurantDescriptionCard.dart';
//
//
//
// class CustomHeaderPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             expandedHeight: 200.0,
//             floating: false,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('Aqaya Dubai'),
//               background: Stack(
//                 children: [
//                   Image.asset(
//                     "assets/images/real/western2.jpg",
//                     height: 0.28.sh,
//                     width: 1.sw,
//                     fit: BoxFit.cover,
//                   ),
//                   Positioned(
//                     top: 50,left: 50,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.black26
//                       ),
//                       child:SizedBox(
//                         width: 300,
//                         height: 120,
//                         child: RestaurantDescriptionCard(
//                           name: "Aqaya Dubai",
//                           image: "assets/images/real/restaurant01.jpeg",
//                           restaurantId: 1,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               height: 800.0, // Adjust the height as needed
//               color: Colors.white,
//               child: ListView.builder(
//                 itemCount: 50,
//                 itemBuilder: (context, index) {
//                   return ListTile(title: Text('Item $index'));
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
