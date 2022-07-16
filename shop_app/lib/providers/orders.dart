import 'package:flutter/foundation.dart';
import './cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderItem {
  final String orderId;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.amount,
    required this.orderId,
    required this.dateTime,
    required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        "https://flutter-shop-app-tutorials-default-rtdb.firebaseio.com/orders.json");
    final timeStamp = DateTime.now();

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts
                .map(
                  (cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'qauntity': cp.quantity,
                    'price': cp.price,
                  },
                )
                .toList(),
          },
        ),
      );
//technically it goes in the then block
      _orders.insert(
        0,
        OrderItem(
          amount: total,
          orderId: json.decode(response.body)['name'],
          dateTime: DateTime.now(),
          products: cartProducts,
        ),
      );
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchandSetOrders() async {
    final url = Uri.parse(
      "https://flutter-shop-app-tutorials-default-rtdb.firebaseio.com/orders.json",
    );
    try {
      final response = await http.get(url);
      final List<OrderItem> loadedOrders = [];

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData == null) {
        return;
      }
      extractedData.forEach(
        (orderId, orderData) => {
          loadedOrders.add(
            OrderItem(
              amount: orderData['amount'],
              orderId: orderId,
              dateTime: DateTime.parse(orderData['dateTime']),
              products: (orderData['products'] as List<dynamic>).map(
                (item) {
                  return CartItem(
                    id: item['id'],
                    price: item['price'],
                    quantity: item['qauntity'],
                    title: item['title'],
                  );
                },
              ).toList(),
            ),
          )
        },
      );
      _orders = loadedOrders.reversed.toList();

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
