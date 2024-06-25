import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildLsitTile(String title, IconData icon, VoidCallback tapHndler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tapHndler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.amber,
            child: Text(
              'Coking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildLsitTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildLsitTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed('filters');
          })
        ],
      ),
    );
  }
}
