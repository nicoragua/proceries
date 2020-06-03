import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceries/models/Ingredient.dart';
import 'package:proceries/models/Recipe.dart';
import 'package:proceries/screens/AddRecipeView.dart';
import 'package:proceries/screens/CustomListView.dart';
import 'package:proceries/screens/widgets/CustomNavigationBar.dart';

class RecipesView extends StatefulWidget {

  @override
  _RecipesViewState createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  List<Recipe> recipes = List<Recipe>();
  Recipe recipe = new Recipe("Pasta", new List<Ingredient>());

  @override
  Widget build(BuildContext context) {
   return CustomListView(
     title: "Recipes",
     items: recipes,
     navigationbar: CustomNavigationBar(1),
     add: () =>
         Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => AddRecipeView(recipe)),
     ),
   );
  }

}
