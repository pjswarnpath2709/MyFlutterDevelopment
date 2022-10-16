import 'package:flutter/material.dart';
import '../screens/edit_product_screen.dart';
import '../widgets/user_product_item_tile.dart';
import '../providers/products_provider.dart';
import '../widgets/main_drawer.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class UserProductsScreen extends StatelessWidget {
  static const String routeName = "/user-products-screen";

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User-Products'),
        actions: [
          IconButton(
            onPressed: () {
              // Something to be done , navigate to new Form Screen
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, index) {
            return Column(
              children: [
                UserProductItemTile(
                  id: productsData.items[index].id,
                  title: productsData.items[index].title,
                  imageUrl: productsData.items[index].imageUrl,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                  endIndent: 10,
                  indent: 10,
                )
              ],
            );
          },
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}