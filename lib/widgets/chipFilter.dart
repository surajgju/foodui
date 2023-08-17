import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';

class ChipFilter extends StatelessWidget {
  ChipFilter(
      {super.key,
      required this.chipText,
      required this.chipTrailing,
      required this.onTap,
      required this.isEnabled});
  String? chipText;
  IconData chipTrailing;
  VoidCallback? onTap;
  bool? isEnabled;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
      color: isEnabled! ? AppColor.green:Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(chipText!,style: TextStyle(color:isEnabled! ?Colors.white:Colors.black45),),
            if (isEnabled!)  Icon(chipTrailing,size: 16.sp, color:isEnabled! ?Colors.white:Colors.black45 ,),
          ],
        ),
      ),
    );
  }
}
