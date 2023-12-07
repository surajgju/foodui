
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qconnect/const/colors.dart';

class ChipOption extends StatelessWidget {
   ChipOption({super.key, required  this.chipText,required this.chipPrefix,required this.chipTrailing, required this.onTap});
   String? chipText;
   IconData chipPrefix;
   IconData chipTrailing;
   VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(

        margin: EdgeInsets.only(right: 6),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
         // color: Colors.red,
            border: Border.all(
                color: AppColor.textColor
            ),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(chipPrefix,size: 16.sp,),
            SizedBox(width: 2.w,),
            Text(chipText!),
            SizedBox(width: 2.w,),
            Icon(chipTrailing,size: 16.sp,),
          ],),),
    );
  }
}


