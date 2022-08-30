import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../widgets/order_item_tile.dart';
import '../providers/orders.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class OrdersScreen extends StatelessWidget {
  static const String routeName = "/orders_screen";

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return OrderItemTile(
            order: orderProvider.orders[index],
          );
        },
        itemCount: orderProvider.orders.length,
      ),
      drawer: const MainDrawer(),
    );
  }
}
