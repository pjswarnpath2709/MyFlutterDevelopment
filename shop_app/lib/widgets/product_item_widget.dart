import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';
import '../effects/Effects.dart';

class ProductItemTile extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItemTile({
  //   required this.id,
  //   required this.imageUrl,
  //   required this.title,
  // });

  @override
  Widget build(BuildContext context) {
    // providing the product
    final product = Provider.of<Product>(context, listen: false);
    // providing the cart
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          );
        },
        child: GridTile(
          footer: GridTileBar(
            leading: Consumer<Product>(
              //use only when you want to change whole widget when the provider changes

              builder: (ctx, product, _) => IconButton(
                icon: product.isFavorite
                    ? const Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        size: 25,
                      ),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                color: Theme.of(context).accentColor,
              ),
            ),
            title: const Text(""),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Added Item to Cart',
                  ),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      }),
                ));
              },
              color: Theme.of(context).accentColor,
            ),
            backgroundColor: Colors.black26,
          ),
          header: GridTileBar(
            title: Text(
              product.title,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Anton',
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              "ProductId : ${product.id.toUpperCase()}",
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Lato',
              ),
            ),
            backgroundColor: Colors.black54,
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
