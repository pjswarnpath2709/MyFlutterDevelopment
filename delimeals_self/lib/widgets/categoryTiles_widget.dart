import '../screens/item_screen.dart';
import 'package:flutter/material.dart';

class CategoryTiles extends StatelessWidget {
  final String catid;
  final String category;
  final String discription;

  CategoryTiles({
    required this.category,
    required this.catid,
    required this.discription,
  });

//Material Page Routes Method
  // void _selectCategory(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return ItemScreen(
  //           categoryId: catid,
  //           categoryTitle: category,
  //         );
  //       },
  //       fullscreenDialog: false,
  //     ),
  //   );
  // }

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ItemScreen.routeName,
      arguments: {
        'id': catid,
        'title': category,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        _selectCategory(context);
      },
      splashColor: Colors.orange,
      child: Container(
        height: 130,
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.orange, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              category,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Text(
                discription,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
