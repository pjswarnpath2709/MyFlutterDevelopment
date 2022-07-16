import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/product_detail_screen";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final itemToShow = Provider.of<Products>(context, listen: true).findById(
        productId); //by listen: false , the widget will not listen if the provided object does not change, and hence the build Method will not run when the provider changes
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " ${itemToShow.title}",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  itemToShow.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Chip(
                    backgroundColor: Colors.lightBlue,
                    label: FittedBox(
                      child: Text(
                        'Price: \$ ${itemToShow.price}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Chip(
                      backgroundColor: Colors.lightBlue,
                      label: FittedBox(
                        child: Text(
                          "Product Id : ${itemToShow.id} ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                margin: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 200,
                  child: Text(
                    itemToShow.discription,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
