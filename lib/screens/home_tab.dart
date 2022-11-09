import 'dart:math';

import 'package:flutter/material.dart';

import '/models/meal.dart';
import '../widgets/meal_details_card.dart';
import '/dummy_data.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = '/home';
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int idx = Random().nextInt(DUMMY_MEALS.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MealCard(
        meal: DUMMY_MEALS[idx],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh_sharp),
        onPressed: () {
          setState(() {
            idx = Random().nextInt(DUMMY_MEALS.length);
          });
        },
      ),
    );
  }
}
