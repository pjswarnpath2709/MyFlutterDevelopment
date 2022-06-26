import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  static String routeName = '/itemscreen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text("The items for the ${categoryTitle}'s category are!"),
      ),
    );
  }
}
