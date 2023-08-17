
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black12
            ),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
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


