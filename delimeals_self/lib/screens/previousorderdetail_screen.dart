import '../models/ordered_items_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailScreen extends StatelessWidget {
  static const String routeName = "/order_detail_screen";
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final PlacedOrder placedOrder = routeArgs["placedOrder"] as PlacedOrder;
    final ls = placedOrder.listofItemsOrdered;
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
            child: Text("Order ID :${placedOrder.hashCode.toString()}")),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          ls[index].imageUrl,
                          height: 125,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                        child: VerticalDivider(
                          thickness: 2,
                          color: Colors.red,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            ls[index].title,
                            style: const TextStyle(fontSize: 24),
                          ),
                          Text(
                            "category : ${ls[index].catId}",
                          ),
                          Text(
                            "type : ${ls[index].type}",
                          ),
                          Text(
                            "price : ₹${ls[index].price.toStringAsFixed(2)}",
                          ),
                          Text(
                            "ratings : ${ls[index].ratings}",
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
              itemCount: ls.length,
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.4,
            indent: 100,
            endIndent: 100,
          ),
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Column(
              children: [
                Text(
                  "Total Items :  ${ls.length}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "Total Amount : ₹${placedOrder.getTotalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  "Date :  ${DateFormat.yMMMd().format(placedOrder.getDateTimeOfOrder)}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Time :  ${DateFormat.jms().format(placedOrder.getDateTimeOfOrder)}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
