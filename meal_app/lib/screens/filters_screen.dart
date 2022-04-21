import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String , bool> currentFilters;
  const FiltersScreen(this.currentFilters , this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState()
  {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final Map<String,bool> selectedFilters = {
                'gluten':_glutenFree,
                'lactose':_lactoseFree,
                'vegan':_vegan,
                'vegetarian':_vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  "Gluten-Free",
                  "Only contains gluten free meals",
                  _glutenFree,
                  (updateValue) {
                    setState(() {
                      _glutenFree = updateValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Lactose-Free",
                  "Only contains lactose free meals",
                  _lactoseFree,
                      (updateValue) {
                    setState(() {
                      _lactoseFree = updateValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegan",
                  "Only contains vegan meals",
                  _vegan,
                      (updateValue) {
                    setState(() {
                      _vegan = updateValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegetarian",
                  "Only contains vegetarian meals",
                  _vegetarian,
                      (updateValue) {
                    setState(() {
                      _vegetarian = updateValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
