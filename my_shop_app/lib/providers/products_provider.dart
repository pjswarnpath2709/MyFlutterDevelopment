import 'package:flutter/material.dart';
import './product.dart';

// ChangeNotifier -> allows a communication between the inherited widgets, by passing all the data into the context tree
class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Product A',
      description: 'Product A is a good Product',
      price: 30.00,
      imageUrl:
          'https://images.unsplash.com/photo-1522643628976-0a170f6722ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdCUyMGF8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    ),
    Product(
      id: 'p2',
      title: 'Product B',
      description: 'Product B is a good Product',
      price: 40.00,
      imageUrl:
          'https://images.unsplash.com/photo-1506152983158-b4a74a01c721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZHVjdCUyMGF8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    ),
    Product(
      id: 'p3',
      title: 'Product C',
      description: 'Product C is a good Product',
      price: 50.00,
      imageUrl:
          'https://images.unsplash.com/photo-1493723843671-1d655e66ac1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2R1Y3QlMjBhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    ),
    Product(
      id: 'p4',
      title: 'Product D',
      description: 'Product D is a good Product',
      price: 60.00,
      imageUrl:
          'https://images.unsplash.com/photo-1491336238524-c990bd671778?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2R1Y3QlMjBhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    ),
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

  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toIso8601String(),
      title: product.title,
      imageUrl: product.imageUrl,
      description: product.description,
      price: product.price,
    );

    _items.add(newProduct);

    notifyListeners();
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  void deleteProduct(String productId) {
    _items.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}
