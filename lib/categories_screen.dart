import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/category_item.dart';
import 'package:flutter_complete_guide/models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal app'),
      ),
      body: GridView(
          children: DUMMY_CATEGORIES
              .map((categoryData) =>
                  CategoryItem(categoryData.title, categoryData.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
