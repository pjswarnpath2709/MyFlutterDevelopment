import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';
import '../widgets/side_drawer.dart';
import '../providers/orders.dart';

class OrdersScreen extends StatefulWidget {
  static const String routeName = '/orders_screen';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Future? _orderFuture;
  Future _obtainOrderFuture() {
    return Provider.of<Orders>(context, listen: false).fetchandSetOrders();
  }

  @override
  void initState() {
    _orderFuture = _obtainOrderFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final ordersData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Orders Screen'),
      ),
      drawer: const SideDrawer(),
      body: FutureBuilder(
        future: _orderFuture,
        builder: (ctx, dataSnapShot) {
          if (dataSnapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapShot.error != null) {
              String errorString = dataSnapShot.error.toString();
              return Center(
                child: Text(
                    "an error occured while fetching orders \n $errorString"),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, ordersData, child) {
                  return ListView.builder(
                    itemBuilder: (ctx, index) {
                      return OrderItemWidget(
                        ordersData.orders[index],
                      );
                    },
                    itemCount: ordersData.orders.length,
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
