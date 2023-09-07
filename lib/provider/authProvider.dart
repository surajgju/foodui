import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodui/screens/home/homeScreen.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import '../screens/auth/sentOTPScreen.dart';
import '../utils/api_provider.dart';
import '../widgets/loading_widget.dart';

class AuthProvider extends ChangeNotifier {
  bool isMobile = true;
  bool enableOtp = false;
  bool enableProceed = false;
  String smsVerificationId = '';
  String smsCode = '';
  TextEditingController emailInputController = TextEditingController();
  TextEditingController mobileInputController =
      TextEditingController(text: "8168673754");
  TextEditingController firstOtp = TextEditingController();
  TextEditingController secondOtp = TextEditingController();
  TextEditingController thirdOtp = TextEditingController();
  TextEditingController fourthOtp = TextEditingController();
  TextEditingController fifthOtp = TextEditingController();
  TextEditingController sixthOtp = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();
var logger = Logger();
  APIProvider apiProvider = APIProvider();
  varifyOtp(context) async {
    loadingWidget(context, true);
    smsCode = firstOtp.text.trim() +
        secondOtp.text.trim() +
        thirdOtp.text.trim() +
        fourthOtp.text.trim() +
        fifthOtp.text.trim() +
        sixthOtp.text.trim();
    Response response = await apiProvider.post(url: "/user/auth/verify", payload: {"otp":smsCode});
    //logger.i(response);

    if(response.data['status']==true){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }else if(response.data['status']==false){
      loadingWidget(context, false);
      warningToast("response.data['message']");
    }else{
      warningToast("Something Went wrong");
    }
    //loadingWidget(context, false);
  }

  loginWithPhone(context) async {
    loadingWidget(context, true);
    Response response = await apiProvider.post(url: "/user/auth", payload: {"phone":mobileInputController.text});
   logger.i(response);
   if(response.data['status']==true){
     //loadingWidget(context, false);
     Navigator.of(context).pushReplacementNamed(SendOTPScreen.routeName);

   }else{
     loadingWidget(context, false);
     warningToast("Something went Wrong");
   }

  }



  signInWithGoogle()async{
  try{
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
          .authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      logger.i(credential);
    }
    }catch(err){
    logger.e(err);
  }
  }

}

randomString() {
  final random = Random();
  const availableChars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final randomString = List.generate(
          8, (index) => availableChars[random.nextInt(availableChars.length)])
      .join();

  return randomString;
}
