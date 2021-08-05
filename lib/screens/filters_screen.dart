import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegetarian = false;
  var _isVegan = false;
  var _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['isGlutenFree'];
    _isVegetarian = widget.currentFilters['isVegetarian'];
    _isVegan = widget.currentFilters['isVegan'];
    _isLactoseFree = widget.currentFilters['isLactoseFree'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> _filters = {
                  'isGlutenFree': _isGlutenFree,
                  'isVegetarian': _isVegetarian,
                  'isVegan': _isVegan,
                  'isLactoseFree': _isLactoseFree,
                };
                widget.saveFilters(_filters);
              },
              icon: Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten free-free meals',
                  _isGlutenFree, (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian',
                  'Only include gluten vegetarian meals',
                  _isVegetarian, (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegan', 'Only include gluten vegan meals', _isVegan,
                  (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Lactose-free',
                  'Only include gluten lactose-free meals',
                  _isLactoseFree, (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
