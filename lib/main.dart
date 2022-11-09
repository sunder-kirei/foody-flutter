import 'package:flutter/material.dart';
import 'package:menu_app/dummy_data.dart';

import '/screens/filters_screen.dart';
import '/screens/home_tab.dart';
import '/screens/category_page.dart';
import '/screens/favourites_screen.dart';
import '/screens/home.dart';
import '/screens/meal_details.dart';
import './screens/categories.dart';
import './models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIdx = 0;

  List<String> favourites = [];

  List<Map<String, bool>> filters = [
    {
      "Show Glutten-free only": false,
    },
    {
      "Show Lactose-free only": false,
    },
    {
      "Show Vegan only": false,
    },
    {
      "Show Vegetarian only": false,
    },
  ];

  void toggleFilters(String key, bool currentValue) {
    setState(() {
      filters.forEach((element) {
        if (element.containsKey(key)) {
          element[key] = currentValue;
        }
      });
    });
  }

  void toggleFavourite(String mealId) {
    setState(() {
      favourites.add(mealId);
    });
  }

  void changeIdx(int newIdx) {
    setState(() {
      _currentIdx = newIdx;
    });
  }

  List<Meal> get availableMeals {
    return DUMMY_MEALS.where((item) {
      if (filters[0]["Show Glutten-free only"]! && !item.isGlutenFree) {
        return false;
      }
      if (filters[1]["Show Lactose-free only"]! && !item.isLactoseFree) {
        return false;
      }
      if (filters[2]["Show Vegan only"]! && !item.isVegan) {
        return false;
      }
      if (filters[3]["Show Vegetarian only"]! && !item.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fooody",
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color.fromARGB(255, 131, 255, 145),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            size: 35,
          ),
          unselectedIconTheme: IconThemeData(
            size: 30,
          ),
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(
            fontSize: 16,
          ),
          elevation: 10,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color.fromARGB(255, 131, 255, 145),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 131, 255, 145),
          foregroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 35,
          ),
          unselectedIconTheme: IconThemeData(
            size: 30,
          ),
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(
            fontSize: 16,
          ),
          elevation: 10,
        ),
      ),
      home: Home(
        changeIdx: changeIdx,
        currentIdx: _currentIdx,
        favourites: favourites,
      ),
      routes: {
        Categories.routeName: (ctx) => const Categories(),
        CategoryPage.routeName: (ctx) => CategoryPage(
              totalMeals: availableMeals,
            ),
        MealDetails.routeName: (ctx) => MealDetails(
              toggleFavourite: toggleFavourite,
              favouriteList: favourites,
            ),
        Favourites.routeName: (ctx) => Favourites(
              favourites: favourites,
            ),
        HomeTab.routeName: (ctx) => const HomeTab(),
        Filters.routeName: (ctx) =>
            Filters(filterList: filters, toggleFilters: toggleFilters),
      },
    );
  }
}
