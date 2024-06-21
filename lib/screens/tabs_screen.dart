import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Meals'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.category,
              ),
              text: 'Category',
            ),
            Tab(
              icon: Icon(
                Icons.favorite,
              ),
              text: 'Favorites',
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
