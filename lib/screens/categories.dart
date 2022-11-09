import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  static const routeName = "/categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, constraints) => GridView.builder(
          itemCount: DUMMY_CATEGORIES.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10),
            child: CategoryItem(
              item: DUMMY_CATEGORIES[index],
            ),
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 1,
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          ),
        ),
      ),
    );
  }
}
