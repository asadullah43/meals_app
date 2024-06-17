import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'category-meals';
  // final String categoryid;
  // final Color? color;
  // final String categorytitle;
  const CategoryMealsScreen({
    super.key,
    // required this.categoryid,
    // this.color,
    // required this.categorytitle,
  });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categorytitle = routeArgs['title'];

    return Scaffold(
        appBar: AppBar(
          title: Text(categorytitle!),
        ),
        body: const Center(
          child: Text('The recipes for the categpry!'),
        ));
  }
}
