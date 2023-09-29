import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/food/restaurantDetailViewScreen.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class RestaurantCompactDetailCard extends StatelessWidget {
  RestaurantCompactDetailCard({
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
        _restaurantId = restaurantId,
        super(key: key);

  final String? _name;
  final String? _image;
  final String? _foods;
  final bool? _ispro;
  final bool? _topchoice;
  final int? _restaurantId;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RestaurantDetailViewScreen.routeName,
            arguments: {"restaurant_id": _restaurantId,});
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10.w,),
          ClipRRect(
            borderRadius: BorderRadius.circular(8).w,
            child: Container(
             // padding: EdgeInsets.fromLTRB(5, 5, 5, 5).r,
             //  decoration: BoxDecoration(
             //      border: Border.all(color: Colors.black12),
             //      borderRadius: BorderRadius.circular(8)),
              width: 85.w,
              height: 85.h,
              child: Image.network(
                _image!,
                fit: BoxFit.cover,
                errorBuilder: (c, o, i) {
                  return Image.asset(
                      Helper.getAssetName("no_image_found.png", "virtual"));
                },
              ),
              // child: Image.asset(_image!),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        constraints:
                            BoxConstraints(minWidth: 100.w, maxWidth: 200.w),
                        child: Text(
                          _name!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Helper.getTheme(context)
                              .headlineMedium
                              ?.copyWith(
                                  color: AppColor.primary, fontSize: 16.sp,fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (_ispro != null)
                        Container(
                          padding: EdgeInsets.only(
                                  left: 5, right: 5, bottom: 2, top: 2)
                              .r,
                          decoration: BoxDecoration(
                              color: Color(0xff011ddd),
                              borderRadius: BorderRadius.circular(3).w),
                          child: Text(
                            "pro"!,
                            style: Helper.getTheme(context)
                                .headlineSmall
                                ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600),
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Text(_foods ?? "Western Food",
                          style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w900)),
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
                          color: AppColor.green,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text('(124) Ratings'),
                      if (_topchoice != null)
                        Container(
                          padding: EdgeInsets.only(
                                  left: 5, right: 5, bottom: 4, top: 4)
                              .r,
                          decoration: BoxDecoration(
                              color: Color(0xfffde7e3),
                              borderRadius: BorderRadius.circular(5).w),
                          child: Row(
                            children: [
                              Image.asset(
                                Helper.getAssetName(
                                    "fav_filled.png", "virtual"),
                                width: 12.w,
                              ),
                              Text(
                                "Top choice"!,
                                style: Helper.getTheme(context)
                                    .headlineSmall
                                    ?.copyWith(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.watch_later_outlined, size: 15),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "39 mins",
                        style: TextStyle(
                          color: AppColor.primary,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Icon(
                        Icons.directions_bike_rounded,
                        color: Colors.black54,
                        size: 15,
                      ),
                      Text(
                        ' 7.50 \₹',
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
