import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart';
import 'dart:math';

class OrderItemWidget extends StatefulWidget {
  final OrderItem order;

  const OrderItemWidget(this.order);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      color: Colors.grey[200],
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.emoji_emotions_outlined,
              size: 30,
            ),
            title: Text(
              '\$ ${widget.order.amount.toStringAsFixed(3)}',
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy , hh:mm:ss a')
                  .format(widget.order.dateTime),
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  maxRadius: 10,
                  child:
                      FittedBox(child: Text('${widget.order.products.length}')),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  icon: Icon(
                    _expanded ? Icons.expand_more : Icons.expand_less,
                  ),
                ),
              ],
            ),
          ),
          if (_expanded)
            SizedBox(
              height: min(widget.order.products.length * 20 + 100, 200),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  final list = widget.order.products;
                  return ListTile(
                    leading: const Icon(Icons.arrow_right_alt),
                    title: Text(
                      list[index].title,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    trailing: Text(
                      '\$ ${list[index].price.toStringAsFixed(3)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
                itemCount: widget.order.products.length,
              ),
            ),
        ],
      ),
    );
  }
}
