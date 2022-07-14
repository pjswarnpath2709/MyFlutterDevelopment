import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final String productId;
  final double price;
  final int qauntity;

  const CartItemWidget({
    required this.id,
    required this.price,
    required this.title,
    required this.productId,
    required this.qauntity,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(productId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.secondary,
          size: 40,
        ),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: const Text('Are You Sure?'),
                content:
                    const Text('Do you want to remove the item from the cart?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: const Text('No')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: const Text('Yes')),
                ],
              );
            });
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text('\$ $price'),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text(
              'Total: \$ ${(price * qauntity).toStringAsFixed(3)}',
            ),
            trailing: Text(
              '$qauntity X',
            ),
          ),
        ),
      ),
    );
  }
}
