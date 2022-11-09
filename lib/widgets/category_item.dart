import 'package:flutter/material.dart';
import '/screens/category_page.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category item;
  const CategoryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            CategoryPage.routeName,
            arguments: item,
          );
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              width: 10,
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(item.title),
          ],
        ),
      ),
    );
  }
}
