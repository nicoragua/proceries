import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceries/models/Ingredient.dart';
import 'package:proceries/models/Recipe.dart';
import 'package:proceries/screens/AddRecipeView.dart';
import 'package:proceries/screens/CustomListView.dart';

class RecipesView extends StatefulWidget {

  @override
  _RecipesViewState createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  List<Recipe> recipes = List<Recipe>();

  @override
  Widget build(BuildContext context) {
   return CustomListView();
  }

  add() {
    Recipe recipe = new Recipe("Pasta", new List<Ingredient>());

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AddRecipeView(recipe)),
    );
  }
}
