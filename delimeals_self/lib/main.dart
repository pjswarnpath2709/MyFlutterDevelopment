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
        '/': (ctx) => TabScreen(),
        TabScreen.routeName: (ctx) => TabScreen(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        ItemScreen.routeName: (ctx) => ItemScreen(),
        ItemDetailScreen.routeName: (ctx) => ItemDetailScreen(),
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
