import 'dart:ffi';

class ShopItem {
  final String catId;
  final String title;
  final String type;
  final String imageUrl;
  final double price;
  final int ratings;
  const ShopItem({
    required this.catId,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.type,
    required this.ratings,
  });
}
