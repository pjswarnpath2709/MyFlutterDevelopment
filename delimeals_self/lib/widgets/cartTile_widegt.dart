import '../widgets/warning_modal_sheet.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/shop_item_model.dart';

class CartTile extends StatelessWidget {
  final ShopItem shopitem;
  final Function removeItemFromCart;
  final DataCollector datacollector;

  CartTile({
    Key? key,
    required this.shopitem,
    required this.removeItemFromCart,
    required this.datacollector,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // EffectsOnScreen.showSnackBar(
                  //   "Are You Sure?",
                  //   "Remove ",
                  //   context,
                  //   () {
                  //     ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  //     removeItemFromCart(shopitem.title);
                  //     EffectsOnScreen.showToast(
                  //         "removed from favourites!", context);
                  //   },
                  // );

                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) {
                      return WarningSheet(
                        warningText: "Are You Sure ,Remove? 🥺",
                        removeItem: removeItemFromCart,
                        title: shopitem.title,
                      );
                    },
                  );
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
