// ignore_for_file: prefer_final_fields, avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:flutter/material.dart';
import '../helpers/db_helper.dart';
import '../models/place.dart';
import '../helpers/location_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  //////+++++++++++++++++++++++++++++++++++++++++//////

  List<Place> get items {
    return [..._items];
  }
  //////+++++++++++++++++++++++++++++++++++++++++//////

  // ADD A PLACE
  Future<void> addPlace(
    String pickedTitle,
    File pickedImage,
    PlaceLocation pickedLoc,
  ) async {
    final address = await LocationHelper.getPlaceAddress(
      pickedLoc.latitude!,
      pickedLoc.longitude!,
    );
    final pickedLocation = PlaceLocation(
      latitude: pickedLoc.latitude,
      longitude: pickedLoc.longitude,
      address: address,
    );

    final newPlace = Place(
      id: DateTime.now().toIso8601String(),
      title: pickedTitle,
      location: pickedLocation,
      image: pickedImage,
    );

    _items.add(newPlace);

    try {
      await DBHelper.insert(
        'user_places',
        {
          'id': newPlace.id,
          'title': newPlace.title,
          'image': newPlace.image.path,
          'loc_lat': newPlace.location.latitude!,
          'loc_lng': newPlace.location.longitude!,
          'address': newPlace.location.address!,
        },
      );
      print([newPlace.location.latitude, newPlace.location.longitude]);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////
  Future<void> fetchAndSetPlaces() async {
    try {
      print('fetching running');
      final dataList = await DBHelper.getData('user_places');

      _items = dataList.map(
        (item) {
          print(item);
          return Place(
            id: item['id'],
            title: item['title'],
            location: PlaceLocation(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              address: item['address'],
            ),
            image: File(item['image']),
          );
        },
      ).toList();
      _items.forEach((place) {
        print([place.location.latitude, place.location.longitude]);
      });
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////
  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
