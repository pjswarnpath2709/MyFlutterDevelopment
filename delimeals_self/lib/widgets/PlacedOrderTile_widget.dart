import 'package:delimeals_self/effects/Effects.dart';
import 'package:delimeals_self/screens/previousorderdetail_screen.dart';

import '../models/ordered_items_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlacedOrderTile extends StatelessWidget {
  final PlacedOrder placedOrder;
  const PlacedOrderTile({
    Key? key,
    required this.placedOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      // padding: const EdgeInsets.only(bottom: 20),
      color: Colors.yellow,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Id : ${placedOrder.hashCode}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    EffectsOnScreen.showToast(
                      "id: ${placedOrder.hashCode.toString()}",
                      context,
                    );
                    Navigator.of(context)
                        .pushNamed(OrderDetailScreen.routeName, arguments: {
                      "placedOrder": placedOrder,
                    });
                  },
                  child: const Text(
                    "See Details",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          ...placedOrder.listofItemsOrdered
              .map(
                (e) => Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " ${e.title}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "=> ItemCat: ${e.catId}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "=> ItemType: ${e.type}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "=> ItemType: ${e.price.toStringAsFixed(2)}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Divider(
                        thickness: 0.2,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          Container(
            width: double.infinity,
            color: Colors.orange,
            child: Text(
              "Toatal Amount : ₹${placedOrder.getTotalPrice.toStringAsFixed(2)}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            color: Colors.orange,
            child: Text(
              "Placed On :\n ${DateFormat.yMMMMd().format(placedOrder.getDateTimeOfOrder)} @ ${DateFormat.jms().format(placedOrder.getDateTimeOfOrder)}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
