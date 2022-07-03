import 'package:delimeals_self/effects/Effects.dart';
import 'package:delimeals_self/models/ordered_items_modal.dart';
import 'package:delimeals_self/widgets/cartTile_widegt.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/shop_item_model.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "/cart_screen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void removeItemFromCart(String title) {
    setState(() {
      DataCollector().removeCartItem(title);
    });
  }

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

  Widget _nonEmptyScreen(BuildContext context, List<ShopItem> ls) {
    final datacollector = DataCollector();
    return LayoutBuilder(
      builder: ((_, constraints) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: constraints.maxHeight * 0.893,
                child: ListView.builder(
                  itemBuilder: ((_, index) {
                    return Column(
                      children: [
                        if (index == 0)
                          const Divider(
                            color: Colors.red,
                            thickness: 0.2,
                            height: 10,
                          ),
                        CartTile(
                          shopitem: ls[index],
                          removeItemFromCart: removeItemFromCart,
                          datacollector: DataCollector(),
                        ),
                        const Divider(
                          color: Colors.red,
                          thickness: 0.2,
                          height: 10,
                        )
                      ],
                    );
                  }),
                  itemCount: ls.length,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    final cartItems = datacollector.getCartItems
                        .where((element) => element.price > 0)
                        .toList();
                    datacollector.addOrderToPreviousOrderList(
                      PlacedOrder(
                        listofItemsOrdered: cartItems,
                      ),
                    );
                    EffectsOnScreen.showToast("Order Placed 😉", context);
                    setState(() {
                      datacollector.clearCart();
                    });
                  },
                  child: const Text("Place Order for All Items In Cart 🤯🤩"),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final datacollector = DataCollector();
    if (datacollector.getCartItems.isEmpty) {
      return _emptyFavouriteAtCenter(
          "https://c.tenor.com/4UTGBVniqM8AAAAi/botak-poor.gif");
    }
    return _nonEmptyScreen(context, datacollector.getCartItems);
  }
}
