import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import '../screens/product_details_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // wrap the parent widget with the provider class
    // one example of a provider class is ChangeNotifierProvider
    return ChangeNotifierProvider(
      //////+++++++++++++++++++++++++++++++++++++++++//////

      // we have to use a create method , which will create an Object of the provider class which is accessible to all it's children directly via context tree

      // if something changes in this Object , then the widgets which are listening to this Provider will automatically change without changing the whole tree or tree structure

      //////+++++++++++++++++++++++++++++++++++++++++//////

      create: (ctx) => Products(),

      //////+++++++++++++++++++++++++++++++++++++++++//////

      child: MaterialApp(
        title: "MyShopApp",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (ctx) => HomeScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
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
