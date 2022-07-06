import '../models/shop_item_model.dart';

class PlacedOrder {
  final DateTime _dateofOrder = DateTime.now();
  final List<ShopItem> listofItemsOrdered;
  double totalPrice = 0.0;
  PlacedOrder({required this.listofItemsOrdered}) {
    for (var element in listofItemsOrdered) {
      totalPrice += element.price;
    }
  }
  DateTime get getDateTimeOfOrder {
    return _dateofOrder;
  }

  double get getTotalPrice {
    return totalPrice;
  }
}
