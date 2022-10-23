import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_shop_app/models/my_exceptions.dart';
import './product.dart';

// ChangeNotifier -> allows a communication between the inherited widgets, by passing all the data into the context tree
class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Product A',
    //   description: 'Product A is a good Product',
    //   price: 30.00,
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1522643628976-0a170f6722ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdCUyMGF8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Product B',
    //   description: 'Product B is a good Product',
    //   price: 40.00,
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1506152983158-b4a74a01c721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZHVjdCUyMGF8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Product C',
    //   description: 'Product C is a good Product',
    //   price: 50.00,
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1493723843671-1d655e66ac1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2R1Y3QlMjBhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'Product D',
    //   description: 'Product D is a good Product',
    //   price: 60.00,
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1491336238524-c990bd671778?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2R1Y3QlMjBhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    // ),
  ];

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

  Future<void> fetchAndSetProducts() async {
    const url =
        'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/products.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final loadedProducts = <Product>[];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((productId, productData) {
        loadedProducts.insert(
          0,
          Product(
            id: productId,
            imageUrl: productData['imageUrl'],
            title: productData['title'],
            description: productData['description'],
            price: productData['price'],
            isFavorite: productData['isFavorite'],
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
    const url =
        'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/products.json';
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
            'isFavorite': product.isFavorite,
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
          'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json';
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
        print(error);
        rethrow;
      }
    }
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  Future<void> deleteProduct(String productId) async {
    final url =
        'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/products/$productId.json';

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
