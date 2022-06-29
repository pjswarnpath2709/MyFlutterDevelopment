import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/dummy_data.dart';

class CartScreen extends StatelessWidget {
  static final String routeName = "/cart_screen";
  const CartScreen({Key? key}) : super(key: key);

  Widget _emptyFavouriteAtCenter(String imageUrl) {
    return Center(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.contain,
            height: 500,
            width: double.infinity,
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Nothing Added To The Cart yet!!..🥴",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final datacollector = DataCollector();
    if (datacollector.getFavoritesItems.isEmpty) {
      return _emptyFavouriteAtCenter(
          "https://c.tenor.com/4UTGBVniqM8AAAAi/botak-poor.gif");
    }
    return const Center(
      child: Text('Favorites'),
    );
  }
}
