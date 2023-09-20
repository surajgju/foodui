import 'package:flutter/material.dart';

import '../../modals/food_order.dart';
import '../../utils/helper.dart';
import '../../widgets/navigate_back_widget.dart';
import 'order_details.dart';

class OrderHistoryScreen extends StatelessWidget {
  // Sample data
  final List<FoodOrder> orders = [
    FoodOrder(id: '1', name: 'Burger', date: '20 Sep 2023', price: 5.50),
    FoodOrder(id: '2', name: 'Pizza', date: '20 Sep 2023', price: 5.50),
    FoodOrder(id: '3', name: 'Momos', date: '20 Sep 2023', price: 5.50),
    FoodOrder(id: '4', name: 'Samosa', date: '20 Sep 2023', price: 5.50),
    FoodOrder(id: '5', name: 'Burger', date: '20 Sep 2023', price: 5.50),
    FoodOrder(id: '6', name: 'Burger', date: '20 Sep 2023', price: 5.50),

    // Add more orders for demonstration...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: back(context),
        title:  Text(
          "Order History",
          style: Helper.getTheme(context).headline5,
        ),

      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(orders[index].name),
            subtitle: Text(orders[index].date),
            trailing: Text('\₹${orders[index].price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailScreen(order: orders[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
