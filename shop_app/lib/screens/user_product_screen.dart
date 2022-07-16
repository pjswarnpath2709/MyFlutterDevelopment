import 'package:flutter/material.dart';
import 'edit_product_screen.dart';
import '../widgets/user_product_item.dart';
import '../widgets/side_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class UserProductScreen extends StatelessWidget {
  static const String routeName = "/user_product_screen";

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(
      context,
      listen: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: '');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, index) {
              return UserProductItem(
                productId: productsData.items[index].id,
                title: productsData.items[index].title,
                imageUrl: productsData.items[index].imageUrl,
              );
            },
            itemCount: productsData.items.length,
          ),
        ),
      ),
    );
  }
}
