import 'package:flutter/material.dart';

import '../../modals/food_order.dart';
import '../../utils/helper.dart';
import '../../widgets/navigate_back_widget.dart';

class OrderDetailScreen extends StatelessWidget {
  final FoodOrder order;

  OrderDetailScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: back(context),
        title:  Text(
          "Order Details",
          style: Helper.getTheme(context).headline5,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order.id}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Food Item: ${order.name}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Order Date: ${order.date}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Price: \₹${order.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
