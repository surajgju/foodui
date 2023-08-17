import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../const/colors.dart';

warningSnack(String message,{Duration? duration, required context}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message,textAlign: TextAlign.center,),
behavior: SnackBarBehavior.floating,
    width: 300,
   // margin: EdgeInsets.only(left: 30, right: 30, bottom: 80),
      padding: EdgeInsets.only(left: 30, right: 10, top: 10, bottom: 10),
      duration:  duration ?? Duration(seconds: 2),
      backgroundColor: Color.fromARGB(255, 223, 96, 87),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.red, width: 1),
      borderRadius: BorderRadius.circular(24),
    ),


  ));

}
warningToast(String message,{Duration? duration}){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
successToast(String message,{Duration? duration}){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


successSnack(String message, {Duration? duration, required context}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    width: 300,
    //margin: EdgeInsets.only(left: 10, right: 10, bottom: 0),
    padding: EdgeInsets.only(left: 30, right: 10, top: 10, bottom: 10),
    duration:  duration ?? Duration(seconds: 2),
    backgroundColor:  AppColor.green,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: AppColor.green, width: 1),
      borderRadius: BorderRadius.circular(24),
    ),
  ));

}
