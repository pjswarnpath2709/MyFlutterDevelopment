import 'package:delimeals_self/widgets/favoriteTile_widget.dart';

import '../effects/Effects.dart';
import '../data/dummy_data.dart';
import 'package:flutter/material.dart';

import '../models/shop_item_model.dart';

class FavouriteScreen extends StatefulWidget {
  static final String routeName = "/favourite_screen";
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
//*********************************************************************************************//
//*********************************************************************************************//
//*********************************************************************************************//
  Widget _emptyFavouriteAtCenter(String imageUrl) {
    return Center(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.contain,
            height: 300,
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

  void removeItemFromTheScreen(String title) {
    setState(() {
      datacollector!.removeFavouriteItem(title);
    });
  }

  Widget _nonEmptyScreen(BuildContext ctx, List<ShopItem> ls) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: ((_, index) {
        return FavouriteTile(
          shopitem: ls[index],
          removeItemFromTheScreen: removeItemFromTheScreen,
          datacollector: DataCollector(),
        );
      }),
      itemCount: ls.length,
    );
  }

//*********************************************************************************************//
//*********************************************************************************************//
//*********************************************************************************************//
  DataCollector? datacollector = null;
  @override
  void initState() {
    datacollector = DataCollector();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (datacollector!.getFavoritesItems.isEmpty) {
      return _emptyFavouriteAtCenter(
          "https://c.tenor.com/uLCGnN7WEdkAAAAi/tkthao219-peach.gif");
    }
    return _nonEmptyScreen(context, datacollector!.getFavoritesItems);
  }
}
