import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title , IconData myIcon , Function tapHandler)
  {
    return ListTile(
      leading: Icon(myIcon,size: 25,),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
          color: Colors.grey,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          buildListTile("Meal", Icons.restaurant , (){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile("Filters", Icons.settings , (){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),

        ],
      ),

    );
  }
}
