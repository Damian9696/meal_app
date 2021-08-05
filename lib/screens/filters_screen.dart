import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegetarian = false;
  var _isVegan = false;
  var _isLactoseFree = false;

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
