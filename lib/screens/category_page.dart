import 'package:flutter/material.dart';
import '../widgets/category_page_item.dart';

import '../dummy_data.dart';
import '../models/meal.dart';
import '../models/category.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category-page";
  final List<Meal> totalMeals;
  const CategoryPage({super.key, required this.totalMeals});

  @override
  Widget build(BuildContext context) {
    final Category meal =
        ModalRoute.of(context)?.settings.arguments as Category;

    List<Meal> availableMeals = totalMeals.where((item) {
      return item.categories.contains(meal.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) =>
            MealItem(meal: availableMeals[index])),
        itemCount: availableMeals.length,
      ),
    );
  }
}
