import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text("User Info"),
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text("HomeScreen"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text("Order History"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text("Admin Products"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
