import '../screens/cart_screen.dart';
import 'package:flutter/material.dart';

class CartScreenToVisit extends StatefulWidget {
  const CartScreenToVisit({Key? key}) : super(key: key);
  static const String routeName = "/cart_to_visit";
  @override
  State<CartScreenToVisit> createState() => _CartScreenToVisitState();
}

class _CartScreenToVisitState extends State<CartScreenToVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Till Yet!"),
        centerTitle: true,
      ),
      body: const CartScreen(),
    );
  }
}
