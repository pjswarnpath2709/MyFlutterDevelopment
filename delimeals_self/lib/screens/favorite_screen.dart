import '../data/dummy_data.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  static final String routeName = "/favourite_screen";
  const FavouriteScreen({Key? key}) : super(key: key);

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
            "Nothing Added To Favorites yet!!..🤧",
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
          "https://c.tenor.com/uLCGnN7WEdkAAAAi/tkthao219-peach.gif");
    }
    return const Center(
      child: Text('Favorites'),
    );
  }
}
