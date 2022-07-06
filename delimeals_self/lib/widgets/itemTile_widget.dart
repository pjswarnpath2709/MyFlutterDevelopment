import '../data/dummy_data.dart';
import '../effects/Effects.dart';
import '../screens/CartScreenToVisit.dart';
import '../screens/FavouriteScreenToVisit.dart';

import '../screens/item_detail_screen.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String category;
  final String title;
  final String catId;
  final String type;
  final double price;
  final int ratings;
  final String imageUrl;

  ItemTile({
    required this.catId,
    required this.category,
    required this.price,
    required this.type,
    required this.title,
    required this.ratings,
    required this.imageUrl,
  });

  void _selectedItemTile(BuildContext cntx) {
    Navigator.of(cntx).pushNamed(
      ItemDetailScreen.routeName,
      arguments: <String, Object>{
        'catId': catId,
        'title': title,
        'price': price,
        'ratings': ratings,
        'imageUrl': imageUrl,
        'type': type,
      },
    );
  }

  Widget _buildDescriptionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          color: Colors.brown,
          child: Container(
            width: 50,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            child: Text(
              "$ratings★",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
          child: VerticalDivider(
            color: Colors.red,
            thickness: 2,
            indent: 5,
            endIndent: 0,
            width: 20,
          ),
        ),
        Text(category),
        const SizedBox(
          height: 15,
          child: VerticalDivider(
            color: Colors.red,
            thickness: 2,
            indent: 5,
            endIndent: 0,
            width: 20,
          ),
        ),
        Text(type),
      ],
    );
  }

  Widget _buildButtonRow(BuildContext cntx) {
    final datacollector = DataCollector();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (datacollector.favouritesAlreadyHas(title)) {
                EffectsOnScreen.showToast(
                    "Already added to Faverites 🥰", cntx);
              } else {
                EffectsOnScreen.showSnackBar(
                  "Added to Favourites ❤️",
                  "See Favourites",
                  cntx,
                  () {
                    ScaffoldMessenger.of(cntx).removeCurrentSnackBar();
                    Navigator.of(cntx)
                        .pushNamed(FavoriteScreenToVisit.routeName);
                  },
                );
                datacollector.addToFavorites(title);
              }
            },
            child: const Text(
              "Add to Favorites ❤️",
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
          child: VerticalDivider(
            color: Colors.red,
            thickness: 2,
            indent: 5,
            endIndent: 0,
            width: 20,
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (datacollector.cartAlreadyHas(title)) {
                EffectsOnScreen.showToast("Already Added to cart 😉🤙", cntx);
              } else {
                EffectsOnScreen.showSnackBar(
                  "Added to Cart! 🥳",
                  "See Cart! 🛒 ",
                  cntx,
                  () {
                    ScaffoldMessenger.of(cntx).removeCurrentSnackBar();
                    Navigator.of(cntx).pushNamed(CartScreenToVisit.routeName);
                  },
                );
                datacollector.addToCart(title);
              }
            },
            child: const Text(
              "Add To Cart 📥",
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      child: Card(
        elevation: 5,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  _selectedItemTile(context);
                },
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: _buildDescriptionRow(),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "₹ ${this.price}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              _buildButtonRow(context),
            ],
          ),
        ),
      ),
    );
  }
}
