import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String , bool> _filters = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String,bool> _filterData){
    setState(() {
      _filters = _filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourites(String mealId){
    final existingIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if(existingIndex>=0)
      {
        setState(() {
          _favouriteMeals.removeAt(existingIndex);
        });
      }
    else
      {
        setState(() {
          _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        });
      }
  }

  bool _isMealFavourite(String id){
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(

          bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1),),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1),),
          headline6: TextStyle(fontSize: 20,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold),

        ),

      ),
      //home: MyHomePage(),
      //home: CategoriesScreen(),

      routes: {
        '/' : (context) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName : (context) => MealDetailsScreen(_toggleFavourites , _isMealFavourite),
        FiltersScreen.routeName : (context) => FiltersScreen(_filters,_setFilters),
      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      //body: CategoriesScreen(),
      body: null,
    );
  }
}
