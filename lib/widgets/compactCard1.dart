import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class CompactCard1 extends StatelessWidget {
  const CompactCard1({
    Key? key,
    @required String? name,
    @required Image? image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String? _name;
  final Image? _image;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10).w,
          child: Container(
            width: 300.w,
            height: 200.h,
            child: _image,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          _name!,
          style: Helper.getTheme(context)
              .headline4
              ?.copyWith(color: AppColor.primary),
        ),
        Row(
          children: [
            Text("Cafe"),
            SizedBox(
              width: 5.w,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                ".",
                style: TextStyle(
                  color: AppColor.green,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text("Western Food"),
            SizedBox(
              width: 20.w,
            ),
            Image.asset(
              Helper.getAssetName("star_filled.png", "virtual"),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "4.9",
              style: TextStyle(
                color: AppColor.green,
              ),
            )
          ],
        )
      ],
    );
  }
}
