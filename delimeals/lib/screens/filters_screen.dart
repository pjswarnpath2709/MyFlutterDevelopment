import 'dart:ffi';

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;
  const FilterScreen(this.filters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'] as bool;
    _lactoseFree = widget.filters['lactose'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchTile({
    required bool changing_value,
    required String title_text,
    required String subtitle_text,
    required Function(bool) updateValue,
  }) {
    return SwitchListTile(
      value: changing_value,
      onChanged: updateValue,
      title: Text(title_text),
      subtitle: Text(subtitle_text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters!'),
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
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  changing_value: _glutenFree,
                  title_text: 'Gluten-Free',
                  subtitle_text: 'Only include gluten-free meals!',
                  updateValue: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  changing_value: _lactoseFree,
                  title_text: 'Lactose-Free',
                  subtitle_text: 'Only include lactose-free meals!',
                  updateValue: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  changing_value: _vegetarian,
                  title_text: 'Vegetarian',
                  subtitle_text: 'Only include vegetarian meals!',
                  updateValue: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  changing_value: _vegan,
                  title_text: 'Vegan',
                  subtitle_text: 'Only include vegan meals!',
                  updateValue: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


//      