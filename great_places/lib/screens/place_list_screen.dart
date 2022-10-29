// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  static const String routeName = "/place-list-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPageScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    builder: (ctx, greatPlacesProvider, ch) {
                      if (greatPlacesProvider.items.isEmpty) {
                        return ch!;
                      } else {
                        return ListView.builder(
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: Hero(
                                    tag: greatPlacesProvider.items[index].id,
                                    child: CircleAvatar(
                                      backgroundImage: FileImage(
                                        greatPlacesProvider.items[index].image,
                                      ),
                                      radius: 30,
                                    ),
                                  ),
                                  title: Text(
                                    greatPlacesProvider.items[index].title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      PlaceDetail.routeName,
                                      arguments:
                                          greatPlacesProvider.items[index].id,
                                    );
                                  },
                                  subtitle: Text(
                                    greatPlacesProvider
                                        .items[index].location.address!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(
                                  endIndent: 0,
                                  indent: 0,
                                  color: Colors.grey,
                                  height: 2,
                                  thickness: 0.2,
                                )
                              ],
                            );
                          },
                          itemCount: greatPlacesProvider.items.length,
                        );
                      }
                    },
                    child: const Center(
                      child: Text('Got No Places Yet!, start Adding some'),
                    ),
                  ),
      ),
    );
  }
}
