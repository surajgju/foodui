
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../provider/cart.dart';
import '../../provider/ordersProviders.dart';
import '../../utils/helper.dart';

class OrderItemsPopup extends StatefulWidget {
  const OrderItemsPopup({super.key});

  @override
  State<OrderItemsPopup> createState() => _OrderdItemsDetailsState();
}

class _OrderdItemsDetailsState extends State<OrderItemsPopup> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final cartProvider = Provider.of<Cart>(context);
    final orderProvider = Provider.of<Orders>(context);
    return   Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: 240),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Text("ITEMS IN CART",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            ),),
          Expanded(
            child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: orderProvider.orders.keys.length,
                itemBuilder: (c,i){
                  String id = orderProvider.orders.keys.elementAt(i);
                  return OrderItemCard(
                      price:( num.parse(orderProvider.orders[id]!.food_price!) * orderProvider.orderQuantity[id]!).toString(),
                      name: orderProvider.orders[id]!.food_name!,
                      quantity:orderProvider.orderQuantity[id]

                  );
                }),
          ),
        ],
      ),
    );
  }
}

class OrderItemCard extends StatelessWidget {
  OrderItemCard({
    Key? key,
    String? name,
    String? price,
    bool? isLast = false,
    int? quantity,
  })  : _name = name,
        _price = price,
        _isLast = isLast,
        _quantity = quantity,
        super(key: key);

  final String? _name;
  final String? _price;
  final bool? _isLast;
  int? _quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: _isLast!
              ? BorderSide.none
              : BorderSide(
            color: AppColor.placeholder.withOpacity(0.25),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${_name} x$_quantity",
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            "$_price ₹",
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
