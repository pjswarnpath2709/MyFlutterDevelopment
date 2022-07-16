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
                  OrderButton(cart: cart),
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

class OrderButton extends StatefulWidget {
  final Cart cart;
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading == true)
          ? null
          : () async {
              setState(
                () {
                  _isLoading = true;
                },
              );
              try {
                final resposne =
                    await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(),
                  widget.cart.totalAmount,
                );
                widget.cart.clearCart();
                setState(
                  () {
                    _isLoading = false;
                  },
                );
                EffectsOnScreen.showToast("orderPlaced", context);
              } catch (error) {}
            },
      child: _isLoading
          ? const CircularProgressIndicator()
          : const Text(
              "Order Now",
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
