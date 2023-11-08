import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../const/colors.dart';
import '../const/constant.dart';
import '../provider/homeScreenProvider.dart';
import '../utils/helper.dart';

class CarouselOne extends StatefulWidget {
   CarouselOne({super.key});

  @override
  State<CarouselOne> createState() => _CarouselOneState();
}

class _CarouselOneState extends State<CarouselOne> {
  int? count;
  final List<Map<String, String>> _pages = [
    {
      "image": "banner01.jpeg",
      "title": "Best Food You Love",
      "desc":
          "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"
    }, {
      "image": "banner3.jpg",
      "title": "Find Food You Love",
      "desc":
          "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"
    },
    {
      "image": "banner03.jpeg",
      "title": "Fast Delivery",
      "desc": "Fast food delivery to your home, office wherever you are"
    },
    {
      "image": "banner4.jpg",
      "title": "Live Tracking",
      "desc":
          "Real time tracking of your food on the app once you placed the order"
    },
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final homeProvider = Provider.of<HomeScreenProvider>(context);
    return SizedBox(
      height: 170.h,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        slivers: [
          SliverFixedExtentList(
        itemExtent: 0.72.sw,
              delegate: SliverChildBuilderDelegate((c,i){
                if(homeProvider.mainBannersList != null && homeProvider.mainBannersList.length>0){
                return  Container(
                  padding: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Image.network(IMAGE_UPLOAD_URL+homeProvider.mainBannersList[i].image!,
                      width: 0.72.sw,
                      height: 170.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                );}else{
                  Container(child: Center(child: CircularProgressIndicator(),),);
                }},
                childCount: homeProvider.mainBannersList.length

          ))
        ],
      ),
    );
  }
}
