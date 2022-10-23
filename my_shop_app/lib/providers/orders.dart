import 'dart:convert';

import 'package:flutter/material.dart';
import '../providers/cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.dateTime,
    required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  //////+++++++++++++++++++++++++++++++++++++++++//////

  List<OrderItem> get orders {
    return [..._orders];
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  Future<void> addOrders(List<CartItem> cartProducts, double total) async {
    const url =
        'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/orders.json';
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts.map(
              (cartProduct) {
                return {
                  'id': cartProduct.id,
                  'title': cartProduct.title,
                  'quantity': cartProduct.quantity,
                  'price': cartProduct.price,
                };
              },
            ).toList(),
          },
        ),
      );

//////********************************//////
      final String respId = json.decode(response.body)['name'] as String;
      _orders.insert(
        0,
        OrderItem(
          id: respId.toString(),
          amount: total,
          dateTime: timeStamp,
          products: cartProducts,
        ),
      );
      notifyListeners();

//////********************************//////

    } catch (error) {
      print(error);
    }
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////
  Future<void> fetchAndSetOrders() async {
    const url =
        'https://myshoppbackend-default-rtdb.asia-southeast1.firebasedatabase.app/orders.json';
    try {
      var loadedOrders = <OrderItem>[];
      final response = await http.get(
        Uri.parse(url),
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((orderId, orderData) {
        loadedOrders.add(
          OrderItem(
            id: orderId,
            amount: orderData['amount'],
            dateTime: DateTime.parse(
              orderData['dateTime'],
            ),
            products: (orderData['products'] as List<dynamic>).map(
              (item) {
                return CartItem(
                    id: item['id'],
                    title: item['title'],
                    quantity: item['quantity'],
                    price: item['price']);
              },
            ).toList(),
          ),
        );
      });

      _orders = loadedOrders.reversed.toList();
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
