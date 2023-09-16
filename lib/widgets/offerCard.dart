import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
class OfferCard extends StatelessWidget {
  OfferCard({
    Key? key,
    @required Image? image,
    @required String? name,
    @required VoidCallback? onTap
  })  : _image = image,
        _name = name,
        _onTap = onTap,
        super(key: key);

  final String? _name;
  final Image? _image;
  VoidCallback? _onTap;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return InkWell(
      onTap: _onTap,
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 150.h,maxWidth: 140.w),
            child: Container(
              // width: 140,
              //height: 150.h,
              margin: EdgeInsets.only(right: 10.sp),
              padding: EdgeInsets.fromLTRB(30.sp, 15.sp, 30.sp, 15.sp),
              decoration: BoxDecoration(
                  color: AppColor.placeholderBg,
                  borderRadius: BorderRadius.circular(10.sp)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 80.h,maxWidth: 80.w,minWidth: 60.w,minHeight: 60.h),
                      // width: 70.w,
                      // height: 70.h,
                      child: _image!),
                  SizedBox(height: 10.h,),
                  Container(
                   // color: Colors.red,
                    width: 75.w,
                    child: Text(
                      _name!,
                      textAlign: TextAlign.center,
                      style: Helper.getTheme(context)
                          .titleMedium

                    ),
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}