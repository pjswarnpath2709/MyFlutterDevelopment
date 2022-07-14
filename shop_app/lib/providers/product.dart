import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String discription;
  final double price;
  final String imageUrl;
  bool isFavorite;
  Product({
    required this.id,
    required this.discription,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  @override
  String toString() {
    return 'hashCode: $hashCode ==> Product{ id : $id , title : $title ,price : $price } ---- ';
  }
}
