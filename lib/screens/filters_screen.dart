import 'package:flutter/material.dart';
import 'package:mealrecipe/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/filter';
  final Function saveFilters;
  final Map<String, bool> _currentFilter;

  FiltersScreen(this.saveFilters, this._currentFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;


  @override
  void initState() {
    _glutenFree = widget._currentFilter['gluten'];
    _lactoseFree = widget._currentFilter['lactose'];
    _vegan = widget._currentFilter['vegan'];
    _vegetarian = widget._currentFilter['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListType(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          },)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListType('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                _buildSwitchListType(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListType(
                    'Vegetarian', 'Only include Vegetarian meals.', _vegetarian,
                        (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _buildSwitchListType(
                    'Vegan', 'Only include Vegan meals.', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
