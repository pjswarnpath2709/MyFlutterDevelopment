import 'package:flutter/material.dart';
import 'package:my_shop_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: {
          'id': id,
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          header: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          footer: GridTileBar(
            leading: IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            title: const Text(
              "",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black26,
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
          ),
        ),
      ),
    );
  }
}
