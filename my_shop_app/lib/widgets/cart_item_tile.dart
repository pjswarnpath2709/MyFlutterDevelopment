import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

// ignore: use_key_in_widget_constructors
class CartTile extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  // ignore: use_key_in_widget_constructors
  const CartTile({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Text('\$${price.toStringAsFixed(2)}'),
              ),
            ),
            title: Text(title),
            subtitle:
                Text('Total : \$${(price * quantity).toStringAsFixed(2)}'),
            trailing: Text('$quantity X'),
          ),
        ),
      ),
    );
  }
}
