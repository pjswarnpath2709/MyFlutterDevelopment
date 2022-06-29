import '../widgets/main_drawer.dart';
import '../screens/cart_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/category_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  static final String routeName = "/tabscreen";
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories ⌘',
    },
    {
      'page': FavouriteScreen(),
      'title': 'Favorites ❤️',
    },
    {
      'page': CartScreen(),
      'title': 'Cart Bag 📥',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final Widget upperTabScreen = DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Items',
        ),
        bottom: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: 'Favourites',
            ),
            Tab(
              icon: Icon(Icons.shopify_sharp),
              text: 'Cart',
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          CategoriesScreen(),
          FavouriteScreen(),
          CartScreen(),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.shopify_sharp),
            label: 'Cart Bag',
          )
        ],
      ),
    );
  }
}
