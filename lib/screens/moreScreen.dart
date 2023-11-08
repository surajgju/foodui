import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/screens/auth/aboutScreen.dart';
import 'package:foodui/screens/inboxScreen.dart';
import 'package:foodui/screens/initial/introScreen.dart';
import 'package:foodui/screens/orders/myOrderScreen.dart';
import 'package:foodui/screens/notificationScreen.dart';
import 'package:foodui/screens/orders/paymentScreen.dart';
import 'package:foodui/utils/helper.dart';
import 'package:foodui/widgets/customNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/firebaseDatafilling.dart';
import 'auth/profileScreen.dart';
import 'orders/order_history.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = "/moreScreen";
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Helper.getScreenHeight(context),
          width: Helper.getScreenWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin:
                          EdgeInsets.only(left: 0, top: 5, bottom: 5, right: 5).r,
                          // decoration: BoxDecoration(
                          //     color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Text(
                        "More",
                        style: Helper.getTheme(context).headline5,
                      ),
                    ],
                  ),
                  Image.asset(
                    Helper.getAssetName("cart.png", "virtual"),
                    scale: 5,
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              MoreCard(
                image: Image.asset(
                  Helper.getAssetName("user.png", "virtual"),
                  color: Colors.black87,
                ),
                name: "User Profile",
                handler: () {
                  Navigator.of(context).pushNamed(ProfileScreen.routeName);

               //   Navigator.of(context).pushNamed(PaymentScreen.routeName);
                },
              ),
              SizedBox(
                height: 20,
              ),
              MoreCard(
                image: Image.asset(
                  Helper.getAssetName("shopping_bag.png", "virtual"),
                  color: Colors.black87,
                ),
                name: "Orders History",
                handler: () {
                  //OrderHistoryScreen
                //  Navigator.of(context).pushNamed(ProfileScreen.routeName);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderHistoryScreen()));
               //   Navigator.of(context).pushNamed(PaymentScreen.routeName);
                },
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // MoreCard(
              //   image: Image.asset(
              //     Helper.getAssetName("income.png", "virtual"),
              //     color: Colors.black87,
              //   ),
              //   name: "Payment Details",
              //   handler: () {
              //     Navigator.of(context).pushNamed(PaymentScreen.routeName);
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
              MoreCard(
                image: Image.asset(
                  Helper.getAssetName("noti.png", "virtual"),
                  color: Colors.black87,
                ),
                name: "Notifications",
                isNoti: true,
                handler: () {
                  Navigator.of(context)
                      .pushNamed(NotificationScreen.routeName);
                },
              ),
              SizedBox(
                height: 10,
              ),
              MoreCard(
                image: Image.asset(
                  Helper.getAssetName("mail.png", "virtual"),
                  color: Colors.black87,
                ),
                name: "Inbox",
                handler: () {
                  Navigator.of(context).pushNamed(InboxScreen.routeName);
                },
              ),
              SizedBox(
                height: 10,
              ),
              MoreCard(
                image: Image.asset(
                  Helper.getAssetName("info.png", "virtual"),
                  color: Colors.black87,
                ),
                name: "About Us",
                handler: () {
                  Navigator.of(context).pushNamed(AboutScreen.routeName);
                },
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // MoreCard(
              //   image: Image.asset(
              //     Helper.getAssetName("info.png", "virtual"),
              //   ),
              //   name: "Temporary",
              //   handler: () {
              //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FirebaseDataFilling()));
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
              MoreCard(
                image: Image.asset(
                  Helper.getAssetName("info.png", "virtual"),
                  color: Colors.black87,
                ),
                name: "Sign Out",
                handler: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString("token", "");
                  Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
   MoreCard({
    Key? key,
    String? name,
    Image? image,
    bool? isNoti = false,
    VoidCallback? handler,
  })  : _name = name,
        _image = image,
        _isNoti = isNoti,
        _handler = handler,
        super(key: key);

  final String?_name;
  final Image? _image;
  final bool? _isNoti;
    VoidCallback? _handler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handler,
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //     //repeat: ImageRepeat.repeatX,
          //     fit: BoxFit.cover,
          //     image: AssetImage("assets/images/virtual/design1.jpeg")),
          border: Border(bottom: BorderSide(color: AppColor.placeholderBg,width: 1),),
          //borderRadius: BorderRadius.circular(10)
        ),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(
                right: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              //  color: AppColor.placeholderBg,
              ),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.white,
                      ),
                      child: _image),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    _name!,
                    style: TextStyle(
                      color: AppColor.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 45.h,
                width: 45.w,
                margin: EdgeInsets.only(right: 10),
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.transparent,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.secondary,
                  size: 17,
                ),
              ),
            ),
            // if (_isNoti!)
            //   Align(
            //     alignment: Alignment.centerRight,
            //     child: Container(
            //       height: 20,
            //       width: 20,
            //       margin: const EdgeInsets.only(
            //         right: 50,
            //       ),
            //       decoration: ShapeDecoration(
            //         shape: CircleBorder(),
            //         color: Colors.red,
            //       ),
            //       child: Center(
            //         child: Text(
            //           "15",
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   )
          ],
        ),
      ),
    );
  }
}
