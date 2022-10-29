import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetail extends StatelessWidget {
  static const String routeName = "/place-detail-screen";
  const PlaceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
    print(
      [
        selectedPlace.location.latitude,
        selectedPlace.location.longitude,
        selectedPlace.location.address,
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedPlace.title,
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: id,
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.file(
                selectedPlace.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              width: double.infinity,
              child: Text(
                selectedPlace.location.address.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MapScreen(
                    initialLocation: selectedPlace.location,
                    isSelecting: false,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.map_sharp,
              color: Colors.amber,
            ),
            label: const Text('View Place on Map!'),
          )
        ],
      ),
    );
  }
}
