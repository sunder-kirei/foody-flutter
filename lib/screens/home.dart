import 'package:flutter/material.dart';
import 'package:menu_app/screens/home_tab.dart';

import '../screens/categories.dart';
import '/widgets/drawer.dart';
import '../screens/favourites_screen.dart';

class Home extends StatelessWidget {
  final int currentIdx;
  final Function changeIdx;
  final List<String> favourites;

  const Home({
    super.key,
    required this.currentIdx,
    required this.changeIdx,
    required this.favourites,
  });

  List<Widget> get pages {
    return [
      const HomeTab(),
      const Categories(),
      Favourites(
        favourites: favourites,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fooody",
        ),
      ),
      drawer: const CustomDrawer(),
      body: pages[currentIdx],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: "Categories",
            tooltip: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: "Favourites",
            tooltip: "Favourites",
          )
        ],
        currentIndex: currentIdx,
        onTap: (index) {
          changeIdx(index);
        },
      ),
    );
  }
}
