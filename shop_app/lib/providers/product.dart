import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {
    final oldStatus = isFavorite;
    _setFavValue(!oldStatus);
    final url = Uri.parse(
        "https://flutter-shop-app-tutorials-default-rtdb.firebaseio.com/products/$id.json");
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            'isFavorite': isFavorite,
          },
        ),
      );
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
  }

  @override
  String toString() {
    return 'hashCode: $hashCode ==> Product{ id : $id , title : $title ,price : $price } ---- ';
  }
}
