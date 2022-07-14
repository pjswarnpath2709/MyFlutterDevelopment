import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './cart_screen.dart';
import '../widgets/badge.dart';
import '../widgets/side_drawer.dart';
import '../providers/cart.dart';
import '../widgets/product_item_grid_widget.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  static const String routeName = "/overview_screen";

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShop"),
        toolbarOpacity: 0.8,
        // backgroundColor: Colors.red.withOpacity(0.8),
        centerTitle: true,
        primary: true,
        toolbarHeight: 60,
        actions: [
          Consumer<Cart>(
            builder: (ctx, cart, ch) => Badge(
              value: cart.length.toString(),
              color: Colors.yellowAccent,
              child: ch!,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text(
                  '| Show Favorites',
                  style: TextStyle(fontFamily: 'Lato'),
                ),
              ),
              PopupMenuItem(
                value: FilterOptions.all,
                child: Text(
                  '| Show All',
                  style: TextStyle(fontFamily: 'Lato'),
                ),
              ),
            ],
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.favorites) {
                if (!_showOnlyFavorites) {
                  setState(() {
                    _showOnlyFavorites = true;
                  });
                }
              } else {
                if (_showOnlyFavorites) {
                  setState(() {
                    _showOnlyFavorites = false;
                  });
                }
              }
            },
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
