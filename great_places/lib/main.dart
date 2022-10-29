// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import '../screens/map_screen.dart';
import '../screens/add_place_screen.dart';
import '../providers/great_places.dart';
import '../screens/place_list_screen.dart';
import 'package:provider/provider.dart';
import '../screens/place_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
        ),
        routes: {
          "/": (ctx) => PlaceListScreen(),
          AddPageScreen.routeName: (ctx) => AddPageScreen(),
          MapScreen.routeName: (ctx) => MapScreen(),
          PlaceDetail.routeName: (ctx) => PlaceDetail(),
        },
      ),
    );
  }
}
