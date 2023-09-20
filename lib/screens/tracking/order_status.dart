
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/screens/tracking/prepare_status.dart';

import 'delivery_status.dart';
import 'locationTracking.dart';

class OrderStatus extends StatefulWidget {
  static const routeName = "/orderStatus";

  const OrderStatus({super.key});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return
        //PrepareStatus();
        DeliveryStatus();



  }
}
