import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/screens/home/homeScreen.dart';
import 'package:foodui/screens/auth/sentOTPScreen.dart';
import 'package:foodui/utils/helper.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:foodui/utils/validators.dart';
import 'package:provider/provider.dart';

import '../../provider/authProvider.dart';
import '../../widgets/customTextInput.dart';
import 'landingScreen.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/introScreen";

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _controller;
  int? count;
  final List<Map<String, String>> _pages = [
    {
      "image": "vector1.png",
      "title": "Find Food You Love",
      "desc":
          "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"
    },
    {
      "image": "vector2.png",
      "title": "Fast Delivery",
      "desc": "Fast food delivery to your home, office wherever you are"
    },
    {
      "image": "vector3.png",
      "title": "Live Tracking",
      "desc":
          "Real time tracking of your food on the app once you placed the order"
    },
  ];

  @override
  void initState() {
    _controller = new PageController();
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          color: AppColor.green,
          child: SafeArea(
            top: true,
            child: Container(
              child: Column(
                children: [
                  // Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 50, left: 300).r,
                        child: Text(
                          "Skip",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50).r,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    height: 200.h,
                    width: double.infinity,
                    color: AppColor.green,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (value) {
                        setState(() {
                          count = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          Helper.getAssetName(
                              _pages[index]["image"]!, "virtual"),
                        );
                      },
                      itemCount: _pages.length,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor:
                            count == 0 ? Colors.white : AppColor.placeholder,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor:
                            count == 1 ? Colors.white : AppColor.placeholder,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor:
                            count == 2 ? Colors.white : AppColor.placeholder,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                    child: Text(
                      _pages[count!]["desc"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                      height: 0.4.sh,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Helper.getAssetName("logo.png", "virtual"),
                                  color: AppColor.green,
                                  width: 100.w,
                                  height: 80.h,
                                )
                              ],
                            ),
                            Text(
                              "Login or Signup",
                              style: TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 45.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            authProvider.isMobile = true;
                                          });
                                        },
                                        child: Text(
                                          "Mobile No",
                                          style: TextStyle(
                                              color: authProvider.isMobile
                                                  ? AppColor.green
                                                  : AppColor.primary,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            authProvider.isMobile = false;
                                          });
                                        },
                                        child: Text(
                                          "Email ID",
                                          style: TextStyle(
                                              color: authProvider.isMobile
                                                  ? AppColor.primary
                                                  : AppColor.green,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 260,
                                          child: authProvider.isMobile
                                              ? CustomTextInput(
                                                  hintText: "Mobile number",
                                                  controller: authProvider
                                                      .mobileInputController,
                                                  keyBoardType:
                                                      TextInputType.phone,
                                                  maxlength: 10,
                                                )
                                              : CustomTextInput(
                                                  hintText: "Email ID",
                                                  controller: authProvider
                                                      .emailInputController,
                                                )),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      SizedBox(
                                        height: 42.h,
                                        width: 80.w,
                                        child: authProvider.isMobile
                                            ? ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(AppColor
                                                                .green)),
                                                onPressed: () {
                                                  if (authProvider
                                                          .mobileInputController
                                                          .text
                                                          .isValidPhoneNumber()) {
                                                    authProvider.loginWithPhone(context);

                                                    // Navigator.of(context)
                                                    //     .pushReplacementNamed(
                                                    //         SendOTPScreen
                                                    //             .routeName);
                                                  } else {
                                                    warningToast(
                                                        "Please enter correct phone number");
                                                  }
                                                },
                                                child: Text("Get OTP"),
                                              )
                                            : ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(AppColor
                                                                .green)),
                                          onPressed: () {
                                            if (authProvider
                                                .emailInputController
                                                .text
                                                .isValidEmail()) {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                  SendOTPScreen
                                                      .routeName);
                                            } else {
                                              warningToast(
                                                  "Please enter correct email Address");
                                            }
                                          },
                                                child: Text("Proceed"),
                                              ),
                                      )
                                      // GestureDetector(child: Container(
                                      //   margin: EdgeInsets.only(left: 10 ),
                                      //
                                      //   child:Text(
                                      //   "Get OTP",
                                      //   style: TextStyle(color: AppColor.primary,fontSize: 20,fontWeight: FontWeight.w600),
                                      // ) ,),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            SizedBox(
                              height: 45.h,
                              width: 330.w,
                              child: GestureDetector(
                                onTap: (){
                                  authProvider.signInWithGoogle();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: AppColor.placeholder),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Image.asset(
                                          Helper.getAssetName(
                                            "google.png",
                                            "virtual",
                                          ),
                                          width: 15.w,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      Text("Continue with Google")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  // Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
