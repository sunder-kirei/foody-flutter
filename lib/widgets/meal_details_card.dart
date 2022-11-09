import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({super.key, required this.meal});

  Widget buildCard(BuildContext context, List<Widget> function, String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              ...function,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get ingredients {
    return meal.ingredients
        .map(
          (item) => Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  "\u2022   $item",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
        .toList();
  }

  List<Widget> get steps {
    return meal.steps
        .map(
          (item) => Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  "\u2022   $item",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Image.network(
        //   meal.imageUrl,
        //   loadingBuilder: (context, child, loadingProgress) =>
        //       loadingProgress == null
        //           ? child
        //           : const Center(
        //               child: CircularProgressIndicator(),
        //             ),
        // ),
        Stack(
          children: [
            Image.network(
              meal.imageUrl,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black45,
                height: 40,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  meal.title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
        buildCard(context, ingredients, "Ingredients"),
        buildCard(context, steps, "Steps"),
      ],
    );
  }
}
