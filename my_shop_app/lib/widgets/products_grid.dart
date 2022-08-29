import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //////+++++++++++++++++++++++++++++++++++++++++//////

    // setting the connection between the provider class and the widget

    final productsData = Provider.of<Products>(context);
    final loadedProducts = productsData.items;

    //////+++++++++++++++++++++++++++++++++++++++++//////

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 5,
      ),

      // will use the custom widget here
      itemBuilder: (ctx, i) => ProductItem(
        id: loadedProducts[i].id,
        imageUrl: loadedProducts[i].imageUrl,
        title: loadedProducts[i].title,
      ),
      itemCount: loadedProducts.length,
    );
  }
}