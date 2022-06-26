import 'package:delimeals_self/widgets/categoryTiles_widget.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text(
          'Categories!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        height: 700,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemBuilder: (ctx, index) {
              return CategoryTiles(
                category: DUMMY_CATEGORY[index].category,
                catid: DUMMY_CATEGORY[index].cat_Id,
                discription: DUMMY_CATEGORY[index].discription,
              );
            },
            itemCount: DUMMY_CATEGORY.length),
      ),
    );
  }
}