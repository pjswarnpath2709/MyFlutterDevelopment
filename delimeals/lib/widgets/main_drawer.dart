import 'package:delimeals/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String text, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            color: Theme.of(context).accentColor,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          buildListTile(
            Icons.restaurant_sharp,
            'Meals!',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          buildListTile(
            Icons.filter,
            'Filters!',
            () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routName);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
