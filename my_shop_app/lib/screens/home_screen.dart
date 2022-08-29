import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';
import '../widgets/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShopApp"),
      ),
      drawer: const MainDrawer(),

      // using the grid view builder
      /**
      
      requirements are - > gridDelegate, itemBuilder like ListViewBuilder , itemCount

      gridDelegate - > how the grid will be structured , aspect ratio of the structure and the spacing between each column and space between rows

      */
      body: ProductGrid(),
    );
  }
}
