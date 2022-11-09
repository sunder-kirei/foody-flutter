import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_page_item.dart';
import '../models/meal.dart';

class Favourites extends StatelessWidget {
  static const routeName = "/favourites";
  final List<String> favourites;

  const Favourites({
    super.key,
    required this.favourites,
  });

  List<Meal> get availableMeals {
    return favourites
        .map((item) => DUMMY_MEALS.firstWhere((element) => element.id == item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: ((context, index) =>
            MealItem(meal: availableMeals[index])),
        itemCount: availableMeals.length,
      ),
    );
  }
}
