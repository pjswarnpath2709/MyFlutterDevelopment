import './warning_modal_sheet.dart';
import '../data/dummy_data.dart';
import 'package:flutter/material.dart';
import '../effects/Effects.dart';
import '../models/shop_item_model.dart';

class FavouriteTile extends StatelessWidget {
  final ShopItem shopitem;
  final Function removeItemFromTheScreen;
  final DataCollector datacollector;
  const FavouriteTile(
      {Key? key,
      required this.shopitem,
      required this.removeItemFromTheScreen,
      required this.datacollector})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      margin: const EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 3,
      ),
      height: 164,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 39, 25, 108),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              shopitem.imageUrl,
              height: 125,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          FittedBox(
            child: Text(
              shopitem.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(109, 40),
                ),
                icon: const Icon(
                  Icons.shop,
                  color: Colors.yellow,
                ),
                label: const FittedBox(
                  child: Text(
                    'Buy Now',
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (datacollector.cartAlreadyHas(shopitem.title)) {
                    EffectsOnScreen.showToast(
                        "Already Added to cart 😉🤙", context);
                  } else {
                    EffectsOnScreen.showSnackBar(
                        "Added to Cart! 🥳", "See Cart! 🛒 ", context, () {});
                    datacollector.addToCart(shopitem.title);
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(109, 40),
                ),
                icon: const Icon(
                  Icons.add,
                  color: Colors.orange,
                ),
                label: const FittedBox(
                  child: Text(
                    'Add Cart',
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) {
                        return WarningSheet(
                          removeItem: removeItemFromTheScreen,
                          title: shopitem.title,
                          warningText: " Are You Sure, Remove?,🥺",
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(109, 40),
                ),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const FittedBox(
                  child: Text(
                    'Remove',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
