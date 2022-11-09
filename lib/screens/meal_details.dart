import 'package:flutter/material.dart';

import '../widgets/meal_details_card.dart';
import '../models/meal.dart';

class MealDetails extends StatelessWidget {
  static const routeName = "/meal-details";

  final Function toggleFavourite;
  final List<String> favouriteList;

  const MealDetails(
      {super.key, required this.toggleFavourite, required this.favouriteList});

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)?.settings.arguments as Meal;
    bool isFavourite = favouriteList.contains(meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: MealCard(
        meal: meal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavourite(meal.id);
        },
        child: Icon(
          isFavourite ? Icons.star_rounded : Icons.star_border_rounded,
          size: 30,
        ),
      ),
    );
  }
}
