import 'package:delimeals_self/screens/filters_screen.dart';
import 'package:delimeals_self/screens/previous_orders.dart';
import 'package:delimeals_self/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  final sizedBoxDivider = const SizedBox(
    height: 1,
    child: Divider(
      color: Colors.grey,
      thickness: 0.4,
      indent: 20,
      endIndent: 20,
      height: 0,
    ),
  );
  final sizedBox = const SizedBox(
    height: 20,
  );

  Widget _buildListTile(String title, IconData icon, VoidCallback func) {
    return ListTile(
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.grey,
        ),
      ),
      onTap: func,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                sizedBox,
                const Text(
                  'Hello User!',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                    color: Colors.transparent,
                    shadows: [
                      Shadow(
                        offset: Offset(0, -10),
                        color: Colors.white,
                      )
                    ],
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                    decorationColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          sizedBox,
          sizedBoxDivider,
          _buildListTile(
            "Home",
            Icons.home_rounded,
            () {
              Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
            },
          ),
          sizedBoxDivider,
          _buildListTile(
            "Filters",
            Icons.filter_alt,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
          ),
          sizedBoxDivider,
          _buildListTile(
            "Previous Orders",
            Icons.rotate_left_rounded,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(PreviousOrderScreen.routeName);
            },
          ),
          sizedBoxDivider,
          Container(
            margin: const EdgeInsets.all(10),
            child: Image.network(
              "https://c.tenor.com/kvXMS__Bkd8AAAAC/hello-hi.gif",
              fit: BoxFit.contain,
              height: 370,
            ),
          )
        ],
      ),
    );
  }
}
