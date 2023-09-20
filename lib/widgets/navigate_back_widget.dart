import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

back(context){
  ScreenUtil.init(context);
  return   GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
      margin:
      EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5).r,
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.black87,
      ),
    ),
  );
}