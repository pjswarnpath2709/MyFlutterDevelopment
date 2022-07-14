import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../screens/cart_screen.dart';
import '../screens/edit_product_screen.dart';
import '../screens/order_screen.dart';
import '../screens/user_product_screen.dart';
import '../providers/cart.dart';
import './screens/product_detail_screen.dart';
import '../screens/product_overview_screen.dart';
import 'providers/products.dart';

void main() {
  runApp(const MyApp());
}

// const int _blackPrimaryValue = 0xFF000000;
// const MaterialColor primaryBlack = MaterialColor(
//   _blackPrimaryValue,
//   <int, Color>{
//     50: Color(0xFF000000),
//     100: Color(0xFF000000),
//     200: Color(0xFF000000),
//     300: Color(0xFF000000),
//     400: Color(0xFF000000),
//     500: Color(_blackPrimaryValue),
//     600: Color(0xFF000000),
//     700: Color(0xFF000000),
//     800: Color(0xFF000000),
//     900: Color(0xFF000000),
//   },
// );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // whenever you create a new object based on a class we will use the create: approach for the change Provider
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          // whenever you create a new object based on a class we will use the create: approach for the change Provider
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          // whenever you create a new object based on a class we will use the create: approach for the change Provider
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.white,
          fontFamily: 'Lato',
        ),
        // home: ,
        routes: {
          '/': (ctx) => ProductOverviewScreen(),
          ProductOverviewScreen.routeName: (ctx) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShop"),
      ),
      body: const Center(
        child: Text("this is HomeScreen For MyApp"),
      ),
    );
  }
}
