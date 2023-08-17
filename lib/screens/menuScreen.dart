import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/screens/dessertScreen.dart';
import 'package:foodui/utils/helper.dart';
import 'package:foodui/widgets/customNavBar.dart';
import 'package:foodui/widgets/searchBar.dart' as sb;
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../provider/menuProvider.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final menuProvider = Provider.of<MenuProvider>(context);
    final cartProvider = Provider.of<Cart>(context);

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Menu",
                        style: Helper.getTheme(context).headline5,
                      ),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top:0,right: 0).r,
                      child: Image.asset(
                        Helper.getAssetName("cart.png", "virtual"),
                        scale: 4,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 20.w,
                        height: 15.h,
                        padding:EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
                        decoration:BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Text(cartProvider.cart.length.toString(),
                            style: TextStyle(color: Colors.white,fontSize: 9),),
                        ),),
                    ),
                  ])
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                sb.SearchBar(title: "Search Food"),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: Helper.getScreenHeight(context) * 0.6,
                    width: Helper.getScreenWidth(context),
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (c, i) => MenuCard(
                              imageShape: ClipOval(
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    Helper.getAssetName("western2.jpg", "real"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              name: menuProvider.list[i],
                              count: "120",
                            )))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              menu: true,
            ),
          )
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    @required String? name,
    @required String? count,
    @required Widget? imageShape,
  })  : _name = name,
        _count = count,
        _imageShape = imageShape,
        super(key: key);

  final String? _name;
  final String? _count;
  final Widget? _imageShape;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      height: 70.h,
      width: 0.8.sw,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,vertical: 5
      ).r,
      padding: const EdgeInsets.only(
        left: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.placeholder,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 80.h,
            width: 80.w,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _imageShape,
            ),
          ),
          Container(
margin: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name!,
                  style: Helper.getTheme(context).headline4?.copyWith(
                        color: AppColor.primary,
                      ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("$_count items")
              ],
            ),
          ),


        ],
      ),
    );
  }
}

