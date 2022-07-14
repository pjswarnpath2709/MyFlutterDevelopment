import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/effects/Effects.dart';
import 'package:shop_app/widgets/cart_item.dart';
import 'package:shop_app/widgets/side_drawer.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cart_screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Cart",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontFamily: 'Anton',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  // const Spacer(),
                  Chip(
                    backgroundColor: Colors.lightBlue,
                    label: Text(
                      "\$ ${cart.totalAmount.toStringAsFixed(3)}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final orders =
                          Provider.of<Orders>(context, listen: false);
                      orders.addOrder(
                        cart.items.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clearCart();
                      EffectsOnScreen.showToast("Order Placed", context);
                    },
                    child: const Text(
                      "Order Now",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final list = cart.items.values.toList();
                final listKeys = cart.items.keys.toList();
                return CartItemWidget(
                  id: list[index].id,
                  price: list[index].price,
                  productId: listKeys[index],
                  title: list[index].title,
                  qauntity: list[index].quantity,
                );
              },
              itemCount: cart.length,
            ),
          )
        ],
      ),
    );
  }
}
