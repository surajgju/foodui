
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/food/restaurantDetailViewScreen.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';
class RestaurantDescriptionCard extends StatelessWidget {
  RestaurantDescriptionCard({
    Key? key,
    @required String? name,
    @required String? image,
    @required String? foods,
    bool? ispro,
    bool? topchoice,
    required int? restaurantId,

  })  : _name = name,
        _image = image,
        _foods = foods,
        _ispro = ispro,
        _topchoice = topchoice,
        _restaurantId= restaurantId,
        super(key: key);

  final String? _name;
  final String? _image;
  final String? _foods;
  final bool? _ispro;
  final bool? _topchoice;
  final  int? _restaurantId;


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
        color :Colors.white,
         // color: Color(0xFFf4f4f4),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8).w,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 10, 0).r,
                  padding: EdgeInsets.fromLTRB(5, 5, 0, 5).r,

                  decoration: BoxDecoration(
                     border:Border.all(color: Colors.black12),
                     borderRadius: BorderRadius.circular(8).w
                  ),
                  width: 85.w,
                  height: 85.h,
                  child: Image.asset(_image!),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 80.h,
                  //color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            constraints:BoxConstraints(minWidth: 100.w,maxWidth: 200.w),

                            child: Text(
                              _name!,
                              overflow: TextOverflow.ellipsis,

                              maxLines: 1,
                              style: Helper.getTheme(context)
                                  .headlineMedium
                                  ?.copyWith(color: AppColor.primary,fontSize: 16.sp),
                            ),
                          ),SizedBox(
                            width: 10,
                          ),
                          if( _ispro != null)   Container(
                            padding: EdgeInsets.only(left: 5,right: 5,bottom: 2,top: 2).r,
                            decoration: BoxDecoration(
                                color: Color(0xff011ddd),
                                borderRadius: BorderRadius.circular(3).w
                            ),
                            child: Text(
                              "pro"!,
                              style: Helper.getTheme(context)
                                  .headlineSmall
                                  ?.copyWith(color: Colors.white,fontSize: 14,fontStyle:FontStyle.italic,fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 3.h,),
                      Row(
                        children: [
                          // Text("Cafe",style: TextStyle(color: Colors.black54)),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: 5.0),
                          //   child: Text(
                          //     ".",
                          //     style: TextStyle(
                          //       color: AppColor.green,
                          //       fontWeight: FontWeight.w900,
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Text(_foods??"Western Food",style: TextStyle(color: Colors.black54)),
                          SizedBox(
                            width: 20.w,
                          ),
                        ],
                      ), SizedBox(height: 2.h,),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xFFFFD700),
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "4.9",
                            style: TextStyle(
                              color: AppColor.primary,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text('(124 Ratings )'),
                          if(_topchoice != null)  Container(
                            padding: EdgeInsets.only(left: 5,right: 5,bottom: 4,top: 4).r,
                            decoration: BoxDecoration(
                                color: Color(0xfffde7e3),
                                borderRadius: BorderRadius.circular(5).w
                            ),
                            child: Row(
                              children: [
                                Image.asset(Helper.getAssetName("fav_filled.png", "virtual"),width: 12.w,),
                                Text(
                                  "Top choice"!,
                                  style: Helper.getTheme(context)
                                      .headlineSmall
                                      ?.copyWith(color: Colors.black54,fontSize: 14,fontStyle:FontStyle.normal,fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: EdgeInsets.only(left: 5),
                // decoration: BoxDecoration(
                //     color: Colors.white, shape: BoxShape.circle),
                child: Icon(Icons.info_outline,color: AppColor.primary,),
              )
            ],
          ),
          // Container(
          //  // color: Colors.yellow,
          //   padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //
          //     Flexible(
          //      // padding: EdgeInsets.only(left: 10,right: 10),
          //       child: Column(
          //         children: [
          //           Text("Delivery fee",style: TextStyle(fontSize: 16,color: Colors.black54),),
          //           SizedBox(height: 5.h,), Text("ADE 6.50",style: TextStyle(fontSize: 17.sp,color: Colors.black87))
          //         ],
          //       ),
          //     ),
          //     Container(height: 45.h,width: 1.w,color: AppColor.placeholder,),
          //     Flexible(
          //      // padding: EdgeInsets.only(left: 10,right: 10),
          //       child: Column(
          //         children: [
          //           Text("Delivery time",style: TextStyle(fontSize: 16,color: Colors.black54),),
          //           SizedBox(height: 5.h,), Text("40 mins",style: TextStyle(fontSize: 17.sp,color: Colors.black87))
          //         ],
          //       ),
          //     ), Container(height: 45.h,width: 1.w,color: AppColor.placeholder,),
          //
          //     Flexible(
          //      // padding: EdgeInsets.only(left: 10,right: 10),
          //       child: Column(
          //         children: [
          //           Text("Delivered by",style: TextStyle(fontSize: 16,color: Colors.black54),),
          //          SizedBox(height: 5.h,),
          //           Text("Qconnect",style: TextStyle(fontSize: 17.sp,color: Colors.black87))
          //         ],
          //       ),
          //     ),
          //
          //   ],),
          // )
        ],
      ),
    );
  }
}