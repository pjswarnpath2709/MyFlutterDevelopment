import '../widgets/PlacedOrderTile_widget.dart';

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class PreviousOrderScreen extends StatefulWidget {
  static String routeName = "/previous_order_screen";
  const PreviousOrderScreen({Key? key}) : super(key: key);

  @override
  State<PreviousOrderScreen> createState() => _PreviousOrderScreenState();
}

class _PreviousOrderScreenState extends State<PreviousOrderScreen> {
  Widget _emptyScreen() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Previous Orders"),
          centerTitle: true,
        ),
        drawer: const MainDrawer(),
        body: const Center(
          child: Text("here are no Previous Orders yet!"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final datacollector = DataCollector();
    final previousOrders = datacollector.getPreviousOrders;
    if (previousOrders.isEmpty) {
      return _emptyScreen();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Previous Orders"),
          centerTitle: true,
        ),
        drawer: const MainDrawer(),
        body: Container(
          height: 800,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (_, index) {
              return PlacedOrderTile(placedOrder: previousOrders[index]);
            },
            itemCount: previousOrders.length,
          ),
        ),
      );
    }
  }
}
