import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _itemsAvailable = [
    Product(
      id: 'p1',
      discription: 'A red t-shirt , pretty red !',
      title: 'Red-Tshirt',
      price: 29.99,
      imageUrl:
          'https://images.unsplash.com/photo-1521498542256-5aeb47ba2b36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    ),
    Product(
      id: 'p2',
      discription: 'A pretty white looking top for ladies!',
      title: 'White-Top',
      price: 39.99,
      imageUrl:
          'https://images.unsplash.com/photo-1566207274740-0f8cf6b7d5a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80',
    ),
    Product(
      id: 'p3',
      discription: 'really cool looking trousers , very beautiful match!',
      title: 'Green-trousers',
      price: 49.99,
      imageUrl:
          'https://images.unsplash.com/photo-1598913870097-4281516c3d21?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2lybCUyMHRyb3VzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    ),
    Product(
      id: 'p4',
      discription: 'A frying pan, with non stick properties',
      title: 'Frying-Pan',
      price: 59.99,
      imageUrl:
          'https://images.unsplash.com/photo-1624031000828-dba1b7a3e4ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    ),
    Product(
      id: 'p5',
      discription: 'A unique kitchen knife , made by purest of steel',
      title: 'Kitchen-Knife',
      price: 23.99,
      imageUrl:
          'https://images.unsplash.com/photo-1604543248368-da42b20dce5b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8a25pZmV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    ),
    Product(
      id: 'p6',
      discription: 'A classy well tailored suit from the paris , a masterpiece',
      title: 'Black-Suit',
      price: 100.99,
      imageUrl:
          'https://images.unsplash.com/photo-1582897291228-f7676bfcd52c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHN1aXRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    ),
  ];

  // var _showProductsOnly = false;

  List<Product> get items {
    // if (_showProductsOnly) {
    //   return _itemsAvailable
    //       .where((element) => element.isFavorite == true)
    //       .toList();
    // }
    return [..._itemsAvailable];
  }

  List<Product> get favItems {
    return _itemsAvailable.where((element) => element.isFavorite).toList();
  }

  // void showFavouritesOnly() {
  //   _showProductsOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showProductsOnly = false;
  //   notifyListeners();
  // }

  void addProducts(Product product) {
    final newProduct = Product(
      title: product.title,
      id: DateTime.now().toString(),
      imageUrl: product.imageUrl,
      price: product.price,
      discription: product.discription,
    );
    _itemsAvailable.add(newProduct);
    notifyListeners();
  }

  void removeProductById(String productId) {
    _itemsAvailable.removeWhere((element) => element.id == productId);
    notifyListeners();
  }

  Product findById(String productId) {
    return _itemsAvailable.firstWhere(
      (element) => productId == element.id,
    );
  }

  void updateProduct(String productId, Product newProduct) {
    final prodidx = _itemsAvailable.indexWhere(
      (prod) => prod.id == productId,
    );
    if (prodidx >= 0) {
      _itemsAvailable[prodidx] = newProduct;
      notifyListeners();
    } else {
      print('nothing done');
    }
  }
}
