import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceries/models/Ingredient.dart';
import 'package:proceries/models/Recipe.dart';
import 'package:proceries/screens/widgets/CustomNavigationBar.dart';

import 'CustomListView.dart';

class AddRecipeView extends StatefulWidget{
  @override
  _AddRecipeViewState createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  Recipe recipe = Recipe("Nudeln", new List<Ingredient>());

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      recipe.name, recipe.ingredients, CustomNavigationBar("TODO"),
    );
  }
}