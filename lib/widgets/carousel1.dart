import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';
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
    return SizedBox(
      height: 185.h,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            SizedBox(width: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.asset(Helper.getAssetName(_pages[0]['image']!,'real'),
                width: 0.85.sw,
                height: 200.h,
                fit: BoxFit.fill,
              ),
            ),SizedBox(width: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.asset(Helper.getAssetName(_pages[1]['image']!,'real'),
                width: 0.85.sw,
                height: 200.h,
                fit: BoxFit.fill,
              ),
            ),SizedBox(width: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.asset(Helper.getAssetName(_pages[2]['image']!,'real'),
                width: 0.9.sw,
                height: 200.h,
                fit: BoxFit.fill,
              ),
            ),SizedBox(width: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.asset(Helper.getAssetName(_pages[3]['image']!,'real'),
                width: 0.9.sw,
                height: 200.h,
                fit: BoxFit.cover,
              ),
            ),

          ]),)
        ],
      ),
    );
  }
}
