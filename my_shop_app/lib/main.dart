import 'package:flutter/material.dart';
import '../screens/cart_screen.dart';
import '../screens/orders_screen.dart';
import '../providers/products_provider.dart';
import '../screens/product_details_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import 'providers/orders.dart';
import '../screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // wrap the parent widget with the provider class
    // one example of a provider class is ChangeNotifierProvider
    return MultiProvider(
      // MultiProvider is used when you have to use more than one ChangeNotifierProvider

      //////+++++++++++++++++++++++++++++++++++++++++//////

      providers: [
        ChangeNotifierProvider(
          //////+++++++++++++++++++++++++++++++++++++++++//////

          // we have to use a create method , which will create an Object of the provider class which is accessible to all it's children directly via context tree

          // if something changes in this Object , then the widgets which are listening to this Provider will automatically change without changing the whole tree or tree structure

          //////+++++++++++++++++++++++++++++++++++++++++//////

          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],

      //////+++++++++++++++++++++++++++++++++++++++++//////

      child: MaterialApp(
        title: "MyShopApp",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (ctx) => ProductOverView(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MY SHOP APP",
        ),
      ),
      body: const Center(
        child: Text("My Own Revision Project"),
      ),
    );
  }
}
