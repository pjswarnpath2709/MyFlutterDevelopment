// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import '../screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/products_grid.dart';
import '../widgets/main_drawer.dart';
import '../widgets/badge.dart';

enum FilterOptions { Favorites, All }

// ignore: use_key_in_widget_constructors
class ProductOverView extends StatefulWidget {
  @override
  State<ProductOverView> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverView> {
  var _showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShopApp"),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Badge(
                value: cart.size.toString(),
                color: Colors.amber,
                child: child!,
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorites) {
                setState(() {
                  _showOnlyFav = true;
                });
              } else {
                setState(() {
                  _showOnlyFav = false;
                });
              }
            },
            itemBuilder: (_) {
              return [
                const PopupMenuItem(
                  value: FilterOptions.Favorites,
                  child: Text('Only Favorites'),
                ),
                const PopupMenuItem(
                  value: FilterOptions.All,
                  child: Text('All Products'),
                ),
              ];
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),

      // using the grid view builder
      /**
      
      requirements are - > gridDelegate, itemBuilder like ListViewBuilder , itemCount

      gridDelegate - > how the grid will be structured , aspect ratio of the structure and the spacing between each column and space between rows

      */
      body: ProductGrid(
        showFavs: _showOnlyFav,
      ),
    );
  }
}
