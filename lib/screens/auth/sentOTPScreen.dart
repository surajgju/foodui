import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../provider/authProvider.dart';
import '../../utils/helper.dart';
import '../newPwScreen.dart';

class SendOTPScreen extends StatelessWidget {
  static const routeName = "/sendOTP";

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
  return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'We have sent you an OTP to your Mobile',
              style: Helper.getTheme(context).headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Please check your mobile number ${authProvider.mobileInputController.text} continue to reset your password ${authProvider.otp}",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                OTPInput(
                  focus: focusNode1,
                  nextNode: focusNode2,
                  controller: authProvider.firstOtp,

                ),
                OTPInput(
                  focus: focusNode2,
                  nextNode: focusNode3,
                  previousNode: focusNode1,
                  controller: authProvider.secondOtp,

                ),
                OTPInput(
                  focus: focusNode3,
                  nextNode: focusNode4,
                  previousNode: focusNode2,
                  controller: authProvider.thirdOtp,

                ),
                OTPInput(
                  focus: focusNode4,
                  nextNode: focusNode5,
                  previousNode: focusNode3,
                  controller: authProvider.fourthOtp,

                ),
                OTPInput(
                  focus: focusNode5,
                  nextNode: focusNode6,
                  previousNode: focusNode4,
                  controller: authProvider.fifthOtp,

                ),
                OTPInput(
                  focus: focusNode6,
                  previousNode: focusNode5,
                  controller: authProvider.sixthOtp,

                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  authProvider.varifyOtp(context);
                  // Navigator.of(context)
                  //     .pushReplacementNamed(NewPwScreen.routeName);
                },
                child: Text("Verify OTP"),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't Recieve? "),
                Text(
                  "Click Here",
                  style: TextStyle(
                    color: AppColor.green,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class OTPInput extends StatelessWidget {
  OTPInput({
    Key? key,
    this.focus,
    this.nextNode,
    this.previousNode,
    this.controller,
  }) : super(key: key);
  FocusNode? focus;
  FocusNode? nextNode;
  FocusNode? previousNode;
TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(

      padding: EdgeInsets.only(left: 10,right:10,top: 10,bottom: 10),
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
       // color: Colors.red,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10).r,
        ),
      ),
      child: SizedBox(

        width: 20.w,
       // height: 40.h,
        child: TextField(
          cursorHeight: 30.sp,
          style: TextStyle(fontSize: 25.sp),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0),

              border: InputBorder.none,
              fillColor: Colors.yellow,
              counterText: "",
              hintText: "*",hintStyle:
          TextStyle(fontSize: 25.sp)),
          maxLength: 1,
          focusNode: focus,
          controller: controller,
          onChanged: (String v){
            if(v.length==1){
              nextNode!= null ? FocusScope.of(context).requestFocus(nextNode):
              FocusScope.of(context).unfocus()
              ;
            }
            else{
              previousNode != null? FocusScope.of(context).requestFocus(previousNode):
            FocusScope.of(context).unfocus();

            }
          },
        ),
      ),
    );
  }
}
