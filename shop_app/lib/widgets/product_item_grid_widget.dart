import 'package:flutter/material.dart';
import '../providers/products.dart';
import './product_item_widget.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoritesOnly;
  ProductsGrid(this.showFavoritesOnly);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final listOfProducts =
        showFavoritesOnly ? productsData.favItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: listOfProducts.length,
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value:
              listOfProducts[index], //use when in the listsViews or gridsViews
          //hence when ever we are resuing the same object use the value : functionality of the ChangeProvider
          child: ProductItemTile(),
        ); //just like ListView.builder()
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ), //how the grid should be structured , i mean how many columns should be there
    );
  }
}
