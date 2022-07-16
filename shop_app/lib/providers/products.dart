import 'package:flutter/material.dart';
import '../models/http_exceptions.dart';
import './product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _itemsAvailable = [];

  List<Product> get items {
    return [..._itemsAvailable];
  }

  List<Product> get favItems {
    return _itemsAvailable.where((element) => element.isFavorite).toList();
  }

  Future<void> fetchAndSetProducts() async {
    var url = Uri.parse(
      "https://flutter-shop-app-tutorials-default-rtdb.firebaseio.com/products.json",
    );
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach(
        (productId, productData) {
          loadedProducts.add(
            Product(
              id: productId,
              title: productData['title'],
              discription: productData['discription'],
              price: productData['price'],
              isFavorite: productData['isFavorite'],
              imageUrl: productData['imageUrl'],
            ),
          );
        },
      );
      _itemsAvailable = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addProducts(Product product) async {
    final url = Uri.parse(
      'https://flutter-shop-app-tutorials-default-rtdb.firebaseio.com/products.json',
    ); //only firebase requires this

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'title': product.title,
            'discription': product.discription,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'isFavorite': product.isFavorite,
          },
        ),
      );
      // this is invisibly wrap in .then() code
      final newProduct = Product(
        title: product.title,
        id: json.decode(response.body)['name'],
        imageUrl: product.imageUrl,
        price: product.price,
        discription: product.discription,
      );
      _itemsAvailable.add(newProduct);
      notifyListeners();
      //this is catch block
    } catch (erorr) {
      rethrow;
    }
  }

  Future<void> removeProductById(String productId) async {
    final url = Uri.parse(
      "https://flutter-shop-app-tutorials-default-rtdb.firebaseio.com/products/$productId.json",
    );
    final existingProductIndex = _itemsAvailable.indexWhere(
      (element) => element.id == productId,
    );
    Product? existingProduct = _itemsAvailable[existingProductIndex];

    _itemsAvailable.removeAt(existingProductIndex);
    try {
      final response = await http.delete(url);
      if (response.statusCode >= 400) {
        //throw your own error
        throw HttpException(
          "Could not Delete Product , status code : ${response.statusCode}",
        );
      }
      existingProduct = null;
    } catch (error) {
      //optimisitic updating, if not deleted from server re-add the product at it's correct index , or we can say it roll-back
      _itemsAvailable.insert(
        existingProductIndex,
        existingProduct!,
      );
      rethrow;
    }

    notifyListeners();
  }

  Product findById(String productId) {
    return _itemsAvailable.firstWhere(
      (element) => productId == element.id,
    );
  }

  Future<void> updateProduct(String productId, Product newProduct) async {
    final prodidx = _itemsAvailable.indexWhere(
      (prod) => prod.id == productId,
    );
    if (prodidx >= 0) {
      final url = Uri.parse(
        "https://flutter-shop-app-tutorials-default-rtdb.firebaseio.com/products/$productId.json",
      );

      await http.patch(
        url,
        body: json.encode(
          {
            'title': newProduct.title,
            'discription': newProduct.discription,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          },
        ),
      );

      _itemsAvailable[prodidx] = newProduct;
      notifyListeners();
    } else {
      print('nothing done');
    }
  }
}
