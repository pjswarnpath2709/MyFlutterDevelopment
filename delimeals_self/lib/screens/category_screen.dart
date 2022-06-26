import 'package:delimeals_self/widgets/categoryTiles_widget.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 213, 204, 204),
            Color.fromARGB(22, 213, 15, 15)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
              color: Colors.transparent,
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
      ),
    );
  }
}
