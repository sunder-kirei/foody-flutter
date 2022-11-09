import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';
import '../screens/favourites_screen.dart';
import '../screens/home_tab.dart';
import '../screens/categories.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  Widget buildListTile(IconData icon, String title, String routeName) {
    return Builder(
      builder: (context) => ListTile(
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(title),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(routeName);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            buildListTile(
              Icons.home_rounded,
              "Home",
              HomeTab.routeName,
            ),
            buildListTile(
              Icons.explore_rounded,
              "Categories",
              Categories.routeName,
            ),
            buildListTile(
              Icons.star_rounded,
              "Favourites",
              Favourites.routeName,
            ),
            buildListTile(
              Icons.settings,
              "Settings",
              Filters.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
