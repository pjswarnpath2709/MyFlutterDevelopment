// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = "/map-screen";
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation = const PlaceLocation(
      latitude: 26.8725482,
      longitude: 75.7591165,
      address: '',
    ),
    this.isSelecting = false,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.initialLocation.latitude!,
                  widget.initialLocation.longitude!,
                ),
                zoom: 16,
              ),
              onTap: widget.isSelecting ? _selectLocation : null,
              markers: (_pickedLocation == null && widget.isSelecting)
                  ? const <Marker>{}
                  : {
                      Marker(
                        markerId: const MarkerId('m1'),
                        position: _pickedLocation ??
                            LatLng(
                              widget.initialLocation.latitude!,
                              widget.initialLocation.longitude!,
                            ),
                      ),
                    },
            ),
          ),
          if (widget.isSelecting)
            ElevatedButton.icon(
              onPressed: (_pickedLocation == null && widget.isSelecting)
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
              icon: const Icon(
                Icons.location_on,
              ),
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              label: const Text(
                'Select Location',
              ),
            ),
        ],
      ),
    );
  }
}
