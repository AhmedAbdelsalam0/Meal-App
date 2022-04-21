import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {

  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favouriteMeals.isEmpty)
      {
        return Center(
          child: Text("You didn't add any favourite meals yet , Start adding some..."),
        );
      }
    else
      {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              duration: favouriteMeals[index].duration,
              complexity: favouriteMeals[index].complexity,
              affordability: favouriteMeals[index].affordability,
            );
          },
          itemCount: favouriteMeals.length,
        );

      }



  }
}
