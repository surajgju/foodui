import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../provider/onBoardingProvider.dart';
import 'landingScreen.dart';
import '../../utils/helper.dart';
import 'introScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    isUserloggedin();
  }

  isUserloggedin()async{
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OnBoardingProvider>(context,listen: false).isUserLoggedin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        color: AppColor.green,
        child: Stack(

          children: [
            Container(
              height: double.infinity,
              width: double.infinity,

              child: Image.asset(
               "assets/images/virtual/splashIcon.png",
                fit: BoxFit.fill,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/virtual/logo.png",
               // color: AppColor.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
