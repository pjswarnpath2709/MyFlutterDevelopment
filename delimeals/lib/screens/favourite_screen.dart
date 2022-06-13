import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favMeals;
  const FavouriteScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: favMeals[index].title,
            imageUrl: favMeals[index].imageUrl,
            affordability: favMeals[index].affordability,
            complexity: favMeals[index].complexity,
            duration: favMeals[index].duration,
            id: favMeals[index].id,
            removeItem: () {},
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}
