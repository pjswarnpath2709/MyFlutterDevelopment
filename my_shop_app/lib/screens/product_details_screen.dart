import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "product_detail_screen";

  @override
  Widget build(BuildContext context) {
//////+++++++++++++++++++++++++++++++++++++++++//////

    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

//////+++++++++++++++++++++++++++++++++++++++++//////

// when you don't want to rebuild the widget if notify listeners is called then you will pass another argument with the context i.e listen : false
    final productData = Provider.of<Products>(context, listen: false);
    final loadedProduct = productData.findProductById(routeArgs['id']!);

//////+++++++++++++++++++++++++++++++++++++++++//////

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: const Center(
        child: Text(
          "Hey there",
        ),
      ),
    );
  }

//////+++++++++++++++++++++++++++++++++++++++++//////

}
