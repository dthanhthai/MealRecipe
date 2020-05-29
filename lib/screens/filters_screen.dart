import 'package:flutter/material.dart';
import 'package:mealrecipe/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static final routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filter'),),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
