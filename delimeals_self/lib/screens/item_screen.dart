import 'package:delimeals_self/data/dummy_data.dart';
import 'package:delimeals_self/models/category_item_model.dart';
import 'package:delimeals_self/models/shop_item_model.dart';
import 'package:delimeals_self/screens/filters_screen.dart';
import 'package:delimeals_self/widgets/filtersWidegt.dart';
import 'package:delimeals_self/widgets/itemTile_widget.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  static String routeName = '/itemscreen';

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  late String categoryTitle;
  late List<ShopItem> selectedListOfItems;
  late Map<String, bool> _availableFilters;
  var _isIntialised = false;

  @override
  void didChangeDependencies() {
    if (!_isIntialised) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      selectedListOfItems = DUMMY_ITEMS.where((ele) {
        return ele.catId == routeArgs['id'] as String;
      }).toList();
      print(selectedListOfItems);
      _availableFilters = {};
      for (final ele in selectedListOfItems) {
        _availableFilters[ele.type] = true;
      }
      _isIntialised = true;
    }
    super.didChangeDependencies();
  }

  void _updateScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _selectedListOfItems = [];
    for (final ele in _availableFilters.entries) {
      for (final itm in selectedListOfItems) {
        if (ele.value == true && ele.key == itm.type) {
          _selectedListOfItems.add(itm);
        }
      }
    }
    print(_selectedListOfItems);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 3),
            child: FlatButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return FiltersWidget(
                      availableFilters: _availableFilters,
                      applyFilters: _updateScreen,
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.filter_alt,
                color: Colors.blue,
              ),
              splashColor: Colors.grey,
              label: const Text(
                "Filters",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
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
              catId: _selectedListOfItems[indx].catId,
              category: _selectedListOfItems[indx].catId,
              price: _selectedListOfItems[indx].price,
              type: _selectedListOfItems[indx].type,
              title: _selectedListOfItems[indx].title,
              ratings: _selectedListOfItems[indx].ratings,
              imageUrl: _selectedListOfItems[indx].imageUrl,
            );
          },
          itemCount: _selectedListOfItems.length,
        ),
      ),
    );
  }
}
