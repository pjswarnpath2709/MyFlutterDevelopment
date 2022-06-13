import 'package:delimeals/data/dummy_data.dart';
import 'package:delimeals/models/meal.dart';
import '../screens/filters_screen.dart';
import '../screens/category_meals_screen.dart';
import 'package:delimeals/screens/meal_deatils.dart';
import 'package:delimeals/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'package:flutter/material.dart';

/*
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
*/
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favuoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        } else if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        } else if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        } else if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex = _favuoriteMeals.indexWhere(
      (element) {
        return mealId == element.id;
      },
    );

    if (existingIndex >= 0) {
      setState(
        () {
          _favuoriteMeals.removeAt(existingIndex);
        },
      );
    } else {
      setState(
        () {
          _favuoriteMeals.add(
            DUMMY_MEALS.firstWhere((element) => element.id == mealId),
          );
        },
      );
    }
  }

  bool _isMealFavourite(String id) {
    return _favuoriteMeals.any((element) => element.id == id);
  }
/*
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'delimeasls',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: const TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //marks the root of the screen
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabScreen(_favuoriteMeals),
        CategoryMealsScreen.routName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routName: (ctx) =>
            MealDetailScreen(_toggleFavourite, _isMealFavourite),
        FilterScreen.routName: (ctx) => FilterScreen(_filters, _setFilters),
      },
      onGenerateRoute: (setting) {
        print(setting.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

/*
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
*/

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //yeh toh har app mein kar hi lena chaiye
  runApp(MyApp());
}
