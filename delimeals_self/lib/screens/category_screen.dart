import '../widgets/categoryTiles_widget.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: ListView.builder(
        // scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(20),
        itemBuilder: (ctx, index) {
          return CategoryTiles(
            category: DUMMY_CATEGORY[index].category,
            catid: DUMMY_CATEGORY[index].cat_Id,
            discription: DUMMY_CATEGORY[index].discription,
          );
        },
        itemCount: DUMMY_CATEGORY.length,
      ),
    );
  }
}
