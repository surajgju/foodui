
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qconnect/screens/tracking/prepare_status.dart';

import 'delivery_status.dart';
import 'locationTracking.dart';

class OrderStatus extends StatefulWidget {
  static const routeName = "/orderStatus";

  const OrderStatus({super.key});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  Widget order = Scaffold(body: Container(
      margin: EdgeInsets.only(top: 10),
      child: PrepareStatus()));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 6),(){
      setState(() {
        order = DeliveryStatus();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return order;
        //DeliveryStatus();



  }

}
