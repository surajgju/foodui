import 'dart:math';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodui/screens/home/homeScreen.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/auth/sentOTPScreen.dart';
import '../utils/api_provider.dart';
import '../widgets/loading_widget.dart';
import 'featuredCategoriesProvider.dart';
import 'homeScreenProvider.dart';

class AuthProvider extends ChangeNotifier {
  bool isMobile = true;
  bool enableOtp = false;
  bool enableProceed = false;
  String smsVerificationId = '';
  String smsCode = '';
  String otpToken = '';
  String otp = '';
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loadingWidget(context, true);
    smsCode = firstOtp.text.trim() +
        secondOtp.text.trim() +
        thirdOtp.text.trim() +
        fourthOtp.text.trim() +
        fifthOtp.text.trim() +
        sixthOtp.text.trim();
   try {
     final payload = FormData.fromMap({"otp": int.parse(smsCode)});

     Response response = await apiProvider.formRequest(
         url: "/auth.html", payload: payload,noToken: true);
     print("Api response is of type "+response.data.runtimeType.toString());
    if( response.data['status']==true){
      if(response.data['token'] != null)
      await prefs.setString("token", response.data['token']);
      notifyListeners();
      getData(context);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }else if(response.data['status']==false){
      await prefs.setString("token", "");
      loadingWidget(context, false);
      warningToast(response.data['message']);
    }else{
      await prefs.setString("token", "");
      warningToast("Something Went wrong");
    }
   }catch(err){
     logger.e(err);
     loadingWidget(context, false);
   }
  }

  loginWithPhone(context) async {
    loadingWidget(context, true);
    final loginRequest = FormData.fromMap({
      'phone': mobileInputController.text,
    });
    // Response response = await apiProvider.post(url: "/login.php", payload: {"phone":num.parse(mobileInputController.text)});
     Response response = await apiProvider.formRequest(url: "/login.html", payload: loginRequest);
   // logger.i(response);
    if(response.data['status']==true){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      otpToken = response.data['otp_token'];
      await prefs.setString("otp_token", otpToken);
      otp = response.data['otp'].toString();
     Navigator.of(context).pushReplacementNamed(SendOTPScreen.routeName);
     successToast("your OTP is "+response.data['otp'].toString());
   }else{
     loadingWidget(context, false);
     warningToast("Something went Wrong");
   }
    loadingWidget(context, false);
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
  getData(context)async{
    final featuredCategoriesProvider = Provider.of<FeaturedCategoriesProvider>(context,listen: false);
    final homeProvider =  Provider.of<HomeScreenProvider>(context,listen: false);
    await featuredCategoriesProvider.getMainFoodCategories();
    await featuredCategoriesProvider.getSpecialFoodCategories();
    Provider.of<HomeScreenProvider>(context,listen: false).getCurrentAddress();
    homeProvider.getMainBanners();

    featuredCategoriesProvider.getTopRestaurant();

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
