import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String productId;
  final String imageUrl;

  UserProductItem({
    required this.title,
    required this.productId,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final ScaffoldMessengerContext = ScaffoldMessenger.of(context);
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                  arguments: productId,
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 20,
              child: VerticalDivider(
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () async {
                try {
                  await Provider.of<Products>(
                    context,
                    listen: false,
                  ).removeProductById(
                    productId,
                  );
                } catch (error) {
                  ScaffoldMessengerContext.showSnackBar(
                    const SnackBar(
                      content: Text('Delete Failed!'),
                    ),
                  );
                }
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
