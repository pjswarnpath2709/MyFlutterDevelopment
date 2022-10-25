import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_shop_app/models/my_exceptions.dart';
import './product.dart';

// ChangeNotifier -> allows a communication between the inherited widgets, by passing all the data into the context tree
class Products with ChangeNotifier {
  final String? authToken;
  final String? userId;
  final List<Product> productsItems;
  List<Product> _items = [];
  Products(this.authToken, this.userId, this.productsItems) {
    _items = productsItems;
  }

  // var _showFavOnly = false;

  //////+++++++++++++++++++++++++++++++++++++++++//////

  // void setShowFavorite(bool value) {
  //   _showFavOnly = value;
  //   notifyListeners();
  // }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  List<Product> get items {
    // spread Operator
    // it is done because it can affect the original data
    // if (_showFavOnly) {
    //   return _items.where((element) => element.isFavorite == true).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  Product findProductById(String id) {
    return _items.firstWhere((element) => id == element.id);
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    final url =
        'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken&$filterString';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final loadedProducts = <Product>[];
      // ignore: unnecessary_null_comparison
      if (extractedData == null) {
        return;
      }

      final favoriteUrl =
          'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/userFavorites/$userId.json?auth=$authToken';

      final favoriteResponse = await http.get(Uri.parse(favoriteUrl));

      final favoriteData = json.decode(favoriteResponse.body);

      extractedData.forEach((productId, productData) {
        loadedProducts.insert(
          0,
          Product(
            id: productId,
            imageUrl: productData['imageUrl'],
            title: productData['title'],
            description: productData['description'],
            price: productData['price'],
            isFavorite:
                favoriteData == null ? false : favoriteData[productId] ?? false,
          ),
        );
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      // print(error);
      rethrow;
    }
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  Future<void> addProduct(Product product) async {
    //////+++++++++++++++++++++++++++++++++++++++++//////

    // where i have to send data
    final url =
        'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken';
    try {
      //////********************************//////
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{}, // meta data is stored in headers with post
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'creatorId': userId
          },
          // the body required the data to be send in json format json.encode() converts the dart objects into json formatted data , json.encode() cannot convert a Custom Class or UserDefined datatypes so generally the data is send in the form of maps
        ),
      );

      //////********************************//////
      final resBody = json.decode(response.body);
      //print(resBody);
      //////********************************//////
      final newProduct = Product(
        id: resBody['name'],
        title: product.title,
        imageUrl: product.imageUrl,
        description: product.description,
        price: product.price,
      );
      _items.add(newProduct);

      notifyListeners();
    } catch (error) {
      //////********************************//////
      // print(error);
      rethrow;
    }
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  Future<void> updateProduct(String id, Product newProduct) async {
    final index = _items.indexWhere((element) => element.id == id);
    if (index >= 0) {
      final url =
          'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json?auth=$authToken';
      try {
        await http.patch(
          Uri.parse(url),
          body: json.encode(
            {
              'title': newProduct.title,
              'description': newProduct.description,
              'imageUrl': newProduct.imageUrl,
              'price': newProduct.price,
            },
          ),
        );
        _items[index] = newProduct;
        notifyListeners();
      } catch (error) {
        // ignore: avoid_print
        print(error);
        rethrow;
      }
    }
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  Future<void> deleteProduct(String productId) async {
    final url =
        'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/products/$productId.json?auth=$authToken';

    final existingProductIndex =
        _items.indexWhere((element) => element.id == productId);

    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    try {
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode >= 400) {
        // Roll Back
        _items.insert(existingProductIndex, existingProduct);
        notifyListeners();
        throw HttpException('${response.statusCode}');
      } else {
        existingProduct = null as Product;
      }
    } catch (error) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      rethrow;
    }
  }
}
