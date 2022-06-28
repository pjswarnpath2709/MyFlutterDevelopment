import 'package:delimeals_self/data/dummy_data.dart';
import 'package:delimeals_self/widgets/itemTile_widget.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  static String routeName = '/itemscreen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'] as String;
    final selectedListOfItems = DUMMY_ITEMS.where((ele) {
      return ele.catId == routeArgs['id'] as String;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        height: 900,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemBuilder: (ctx, indx) {
            return ItemTile(
              catId: selectedListOfItems[indx].catId,
              category: selectedListOfItems[indx].catId,
              price: selectedListOfItems[indx].price,
              type: selectedListOfItems[indx].type,
              title: selectedListOfItems[indx].title,
              ratings: selectedListOfItems[indx].ratings,
              imageUrl: selectedListOfItems[indx].imageUrl,
            );
          },
          itemCount: selectedListOfItems.length,
        ),
      ),
    );
  }
}
