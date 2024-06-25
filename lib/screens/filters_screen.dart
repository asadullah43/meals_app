import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;

  const FilterScreen(
      {super.key, required this.saveFilters, required this.currentFilter});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'] ?? false;
    _lactoseFree = widget.currentFilter['lactose'] ?? false;
    _vegan = widget.currentFilter['vegan'] ?? false;
    _vegetarian = widget.currentFilter['vegetarian'] ?? false;

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, void Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: const Icon(Icons.save)),
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('Adjust your meal selaction.',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile('Gluten-Free',
                    'Only include gluten-free meals.', _glutenFree, (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'lactose-Free',
                    'Only include Lactose-free meals.',
                    _lactoseFree, (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                    (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include _vegan meals.', _vegan, (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                }),
              ],
            ))
          ],
        ));
  }
}
