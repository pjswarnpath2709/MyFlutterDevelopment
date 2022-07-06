import 'package:delimeals_self/models/ordered_items_modal.dart';
import 'package:delimeals_self/models/shop_item_model.dart';

import '../widgets/buyWidget.dart';
import '../effects/Effects.dart';
import './CartScreenToVisit.dart';
import './FavouriteScreenToVisit.dart';
import 'package:flutter/material.dart';
import "../data/dummy_data.dart";

class ItemDetailScreen extends StatelessWidget {
  static String routeName = "/item_deatil_screen";

  Widget _buildButtonTray(BuildContext ctx, String title) {
    final datacollector = DataCollector();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            if (datacollector.favouritesAlreadyHas(title)) {
              ScaffoldMessenger.of(ctx).removeCurrentSnackBar();
              EffectsOnScreen.showToast("Already added to Faverites 🥰", ctx);
            } else {
              datacollector.addToFavorites(title);
              EffectsOnScreen.showSnackBar(
                "Added to Favourites ❤️",
                "See Favourites",
                ctx,
                () {
                  ScaffoldMessenger.of(ctx).removeCurrentSnackBar();
                  Navigator.of(ctx).pushNamed(FavoriteScreenToVisit.routeName);
                },
              );
            }
          },
          child: const Text(
            'Add to Favorite',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: ctx,
              builder: (_) {
                ShopItem shpitm = DUMMY_ITEMS.firstWhere(
                  (element) => element.title == title,
                );
                return BuyModalSheet(
                  placedOrder: PlacedOrder(
                    listofItemsOrdered: [shpitm],
                  ),
                  extraThingsToDo: () {},
                );
              },
            );
          },
          child: const Text(
            'Buy Now',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (datacollector.cartAlreadyHas(title)) {
              ScaffoldMessenger.of(ctx).removeCurrentSnackBar();
              EffectsOnScreen.showToast("Already Added to cart 😉🤙", ctx);
            } else {
              datacollector.addToCart(title);
              ScaffoldMessenger.of(ctx).removeCurrentSnackBar();
              EffectsOnScreen.showSnackBar(
                "Added to Cart! 🥳",
                "See Cart! 🛒 ",
                ctx,
                () {
                  ScaffoldMessenger.of(ctx).removeCurrentSnackBar();
                  Navigator.of(ctx).pushNamed(CartScreenToVisit.routeName);
                },
              );
            }
          },
          child: const Text(
            'Add to Cart',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final String catId = routeArgs['catId'] as String;
    final String imageUrl = routeArgs['imageUrl'] as String;
    final String title = routeArgs['title'] as String;
    final double price = routeArgs['price'] as double;
    final String type = routeArgs['type'] as String;
    final int ratings = routeArgs['ratings'] as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 1,
        ),
        height: 700,
        child: Column(
          children: [
            Card(
              elevation: 2,
              shadowColor: Colors.redAccent,
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  height: 280,
                  width: double.infinity,
                ),
              ),
            ),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 330,
                width: double.infinity,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.brown,
                        thickness: 2,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.brown,
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "₹${price.toStringAsFixed(2)}  | $ratings★",
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.brown,
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Category:- ${catId.toUpperCase()} |  Type:- ${type.toUpperCase()} ",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "The above Atire falls under the category of  ${type.toUpperCase()} and can be used on relative occasions, hand crafted with finest of the fabric.This a type of short descrption to make user by this product agar user ne yeh product nahi kahreeda toh hum gareeb ho jayenge sachi mein please aake khareed ko yaar!",
                      ),
                      Text(
                        "it perfectly blends with all styles weared by ${catId.toUpperCase()}",
                      ),
                      const Divider(
                        color: Colors.brown,
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Features: ",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "✅ further purchase points\n\n✅ further purchase points\n\n✅ further purchase points\n\n✅ further purchase points\n\n✅ further purchase points\n\n✅ further purchase points\n\n✅ further purchase points\n\n✅ further purchase points",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.brown,
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Discription: ",
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "The standard Lorem Ipsum passage, used since the 1500s Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Section 1.10.32 of de Finibus Bonorum et Malorum, written by Cicero in 45 BC Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? 1914 translation by H. Rackham But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? Section 1.10.33 of de Finibus Bonorum et Malorum, written by Cicero in 45 BC At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
                      ),
                      const Divider(
                        color: Colors.brown,
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildButtonTray(context, title),
          ],
        ),
      ),
    );
  }
}
