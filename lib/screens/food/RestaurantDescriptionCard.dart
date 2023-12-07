import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qconnect/screens/food/restaurantDetailViewScreen.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class RestaurantDescriptionCard extends StatelessWidget {
  RestaurantDescriptionCard({
    Key? key,
    @required String? name,
    @required String? image,
    @required String? foods,
    @required String? location,
    @required num? deliveryFees,
    @required String? deliveryTime,
    bool? ispro,
    bool? topchoice,
    required int? restaurantId,
  })  : _name = name,
        _image = image,
        _foods = foods,
        _ispro = ispro,
        _topchoice = topchoice,
        _restaurantId = restaurantId,
        _location = location,
        _deliveryFees = deliveryFees,
        _deliveryTime = deliveryTime,
        super(key: key);

  final String? _name;
  final String? _image;
  final String? _foods;
  final bool? _ispro;
  final bool? _topchoice;
  final int? _restaurantId;
  final String? _location;
  final num? _deliveryFees;
  final String? _deliveryTime;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      // Replace "Colors.blue" with your desired color
    );
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0).r,
      decoration: BoxDecoration(
          color: Colors.white,
          // color: Color(0xFFf4f4f4),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 12, 0, 0).r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8).w,
                  child: SizedBox(
                    width: 85.w,
                    height: 85.h,
                    child: Image.network(
                      _image!,
                      fit: BoxFit.fill,
                        errorBuilder: (c, o, i) {
                          return Image.asset(
                              Helper.getAssetName("no_image_found.png", "virtual"));
                        }
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 110.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                minWidth: 100.w, maxWidth: 180.w),
                            child: Text(
                              _name!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Helper.getTheme(context)
                                  .headlineMedium
                                  ?.copyWith(
                                      color: AppColor.primary, fontSize: 16.sp),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [

                          Text(_foods ?? "Food Type",
                              style: TextStyle(color: Colors.black54)),
                          SizedBox(
                            width: 20.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.black26,
                            size: 16.sp,
                          ),

                          SizedBox(
                              width: 140.w,
                              child: Text(_location ?? "Address",style: TextStyle(fontSize: 12,height: 1,color:Colors.black54),overflow: TextOverflow.ellipsis,maxLines: 2,)),

                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(children: [
                        Text("Delivery fee : ",style: TextStyle(fontSize: 13,color: Colors.black54),),
                        SizedBox(height: 5.h,), Text("${_deliveryFees.toString()} \₹",style: TextStyle(fontSize: 12.sp,color: Colors.black87))
                      ],),  Row(children: [
                        Text("Delivery time : ",style: TextStyle(fontSize: 13,color: Colors.black54),),
                        SizedBox(height: 5.h,), Text(_deliveryTime!,style: TextStyle(fontSize: 12.sp,color: Colors.black87))   ],)
                    ],
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              //   margin: EdgeInsets.only(left: 5),
              //   // decoration: BoxDecoration(
              //   //     color: Colors.white, shape: BoxShape.circle),
              //   child: Icon(
              //     Icons.info_outline,
              //     color: AppColor.primary,
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
