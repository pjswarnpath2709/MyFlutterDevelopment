import 'package:delimeals_self/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class FavoriteScreenToVisit extends StatefulWidget {
  static const String routeName = "/favorite_screen_to_visit";
  const FavoriteScreenToVisit({Key? key}) : super(key: key);

  @override
  State<FavoriteScreenToVisit> createState() => _FavoriteScreenToVisitState();
}

class _FavoriteScreenToVisitState extends State<FavoriteScreenToVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Items You Liked 😁",
        ),
        centerTitle: true,
      ),
      body: const FavouriteScreen(),
    );
  }
}
