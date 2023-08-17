import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
class CategoryCard extends StatelessWidget {
   CategoryCard({
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
          Container(
            width: double.infinity,
            height: 100.h,
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15).r,
            decoration: BoxDecoration(
            //  image: DecorationImage(image: AssetImage("assets/images/virtual/blue_fade_back.jpeg"),fit: BoxFit.cover),
              color: AppColor.placeholderBg,
                borderRadius: BorderRadius.circular(10).w

            ),
            child: _image,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            _name!,
            style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.black87),
          ),
        ],
      ),
    );
  }
}