import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

// ignore: use_key_in_widget_constructors
class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/product_detail_screen";

  @override
  Widget build(BuildContext context) {
//////+++++++++++++++++++++++++++++++++++++++++//////

    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

//////+++++++++++++++++++++++++++++++++++++++++//////

// when you don't want to rebuild the widget if notify listeners is called then you will pass another argument with the context i.e listen : false
    final productsData = Provider.of<Products>(context, listen: false);
    final loadedProduct = productsData.findProductById(routeArgs['id']!);

//////+++++++++++++++++++++++++++++++++++++++++//////

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Center(
          child: Column(
        children: [
          Card(
            child: Image.network(
              loadedProduct.imageUrl,
              height: 400,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Chip(
            label: Text('\$ ${loadedProduct.price.toStringAsFixed(2)}'),
          ),
          Chip(
            label: Text(loadedProduct.id),
          ),
          SizedBox(
            height: 100,
            width: 300,
            child: Card(
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }

//////+++++++++++++++++++++++++++++++++++++++++//////

}
