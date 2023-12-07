import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qconnect/const/colors.dart';
import 'package:qconnect/utils/helper.dart';
import 'package:qconnect/widgets/customNavBar.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notiScreen";
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black87,
          ),
        ),
        title:  Text(
          "Notifications",
          style: Helper.getTheme(context).headline5,
        ),
      ),
      body: SafeArea(

          child: ListView(
        children: [

          SizedBox(
            height: 20,
          ),
          NotiCard(
            title: "Your order has been delivered",
            time: "1 h ago",
            color: AppColor.placeholderBg,
          ),
        ],
      )),
    );
  }
}

class NotiCard extends StatelessWidget {
  const NotiCard({
    Key? key,
    String? time,
    String? title,
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _color = color,
        super(key: key);

  final String? _time;
  final String? _title;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Container(
      height: 80.h,
     // width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
        border: Border(
          bottom: BorderSide(
            color: AppColor.placeholder,
            width: 0.5,
          ),
        ),
      ),
      //padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: AppColor.green,
            radius: 5,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width:300.w,
                child: Text(
                  _title!,
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 16.sp
                  ),
                ),
              ),
              Text(_time!,style:TextStyle(
                  color: AppColor.primary,
                  fontSize: 12.sp
              )),
            ],
          )
        ],
      ),
    );
  }
}
