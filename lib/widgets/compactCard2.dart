import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';
import '../screens/food/restaurantDetailViewScreen.dart';
import '../utils/helper.dart';

class CompactCard2 extends StatelessWidget {
  const CompactCard2({
    Key? key,
    @required String? name,
    @required String? image,
    @required String? imageTitle,
    @required String? imageSubTitle,
    @required String? orderTime,

  })  : _name = name,
        _image = image,
        _imageTitle=imageTitle,
        _imageSubTitle=imageSubTitle,
        _orderTime=orderTime,
        super(key: key);

  final String? _name;
  final String? _image;
  final String? _imageTitle;
  final String? _imageSubTitle;
  final String? _orderTime;


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(RestaurantDetailViewScreen.routeName,arguments: {"restaurantId":"_restaurantId"});

          },
          child: Stack(

            children:[ ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                _image!,
                width: 90.w,
                height: 100.h,
                fit: BoxFit.cover,

              ),),

              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: 90.w,
                  padding: EdgeInsets.only(left: 7,bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(14),bottomLeft: Radius.circular(14)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors:[
                          Colors.black12,
                          Colors.black
                        ] )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("AED $_imageTitle",style:TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w900),),
                      Text("$_imageSubTitle",style: TextStyle(color: Colors.white,fontSize: 10),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          width: 90.w,
          padding: EdgeInsets.only(left: 5),
          child: Text(
            _name!,
            style: Helper.getTheme(context)
                .labelSmall
                ?.copyWith(color: AppColor.primary),
          ),
        ),
        Container(
          width: 60.w,
          padding: EdgeInsets.only(left: 5),
          child: Text(_orderTime!),
        )
      ],
    );
  }
}
