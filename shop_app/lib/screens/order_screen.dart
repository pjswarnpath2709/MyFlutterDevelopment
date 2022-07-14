import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';
import '../widgets/side_drawer.dart';
import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders_screen';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Orders Screen'),
      ),
      drawer: const SideDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return OrderItemWidget(
            ordersData.orders[index],
          );
        },
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
