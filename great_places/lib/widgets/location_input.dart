// ignore_for_file: avoid_print, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  Function onSelectPlace;
  LocationInput(this.onSelectPlace);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: locData.latitude!,
        longitude: locData.longitude!,
      );
      setState(() {
        _previewImageUrl = staticMapImageUrl;
      });
      widget.onSelectPlace(locData.latitude, locData.longitude);
    } catch (error) {
      print(error);
    }
  }

  Future<void> _selectLocation() async {
    try {
      final LatLng? selectedLocation =
          await Navigator.of(context).push<LatLng?>(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => MapScreen(
            isSelecting: true,
          ),
        ),
      );
      if (selectedLocation == null) {
        return;
      }
      final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: selectedLocation.latitude,
        longitude: selectedLocation.longitude,
      );
      setState(() {
        _previewImageUrl = staticMapImageUrl;
      });
      widget.onSelectPlace(
          selectedLocation.latitude, selectedLocation.longitude);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 270,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          width: double.infinity,
          child: _previewImageUrl == null
              ? const Text(
                  'No Location Chosen!',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: const Icon(Icons.location_searching_outlined),
              label: const Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: _selectLocation,
              label: const Text('Choose Location'),
              icon: const Icon(Icons.map),
            ),
          ],
        )
      ],
    );
  }
}
