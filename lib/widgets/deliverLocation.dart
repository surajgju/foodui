
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';

class DeliverLocation extends StatelessWidget {
   DeliverLocation({super.key,required this.location });
String location;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(

          child: Text("Delivering to", style: TextStyle(fontSize: 12,color:AppColor.primary)),
        ), DropdownButtonHideUnderline(
          child: SizedBox(
            width: 120.w,
            height: 20.h,
            child: Text(location,softWrap: true,overflow: TextOverflow.ellipsis,),
            // child: DropdownButton(
            //   value: "current location",
            //   items: [
            //     DropdownMenuItem(
            //       child: Text("Current Location"),
            //       value: "current location",
            //     ),
            //   ],
            //   icon: Icon(Icons.keyboard_arrow_down_outlined,
            //     color: AppColor.green,
            //     size: 18,
            //   ),
            //   style: TextStyle(fontSize: 13,color: Colors.black38,fontWeight: FontWeight.w600),
            //   onChanged: (_) {},
            // ),
          ),
        ),
      ],
    );
  }
}
