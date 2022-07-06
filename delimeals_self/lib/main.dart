import '../screens/CartScreenToVisit.dart';
import '../screens/FavouriteScreenToVisit.dart';
import '../screens/cart_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/previous_orders.dart';
import '../screens/previousorderdetail_screen.dart';
import '../screens/category_screen.dart';
import '../screens/item_detail_screen.dart';
import '../screens/item_screen.dart';
import '../screens/tab_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Practice',

      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.lightBlue,
        textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontSize: 22,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            titleMedium: const TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titleSmall: const TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.normal,
              color: Colors.white,
            )),
      ),

      //initial route
      initialRoute: '/',

      //initialising all the routes
      routes: {
        '/': (ctx) => const TabScreen(),
        TabScreen.routeName: (ctx) => const TabScreen(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        ItemScreen.routeName: (ctx) => ItemScreen(),
        ItemDetailScreen.routeName: (ctx) => ItemDetailScreen(),
        FavouriteScreen.routeName: (ctx) => const FavouriteScreen(),
        CartScreen.routeName: (ctx) => const CartScreen(),
        FavoriteScreenToVisit.routeName: (ctx) => const FavoriteScreenToVisit(),
        CartScreenToVisit.routeName: (ctx) => const CartScreenToVisit(),
        OrderDetailScreen.routeName: (ctx) => const OrderDetailScreen(),
        PreviousOrderScreen.routeName: (ctx) => const PreviousOrderScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CategoriesScreen();
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
