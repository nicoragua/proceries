import 'package:flutter/cupertino.dart';
import 'package:proceries/models/Recipe.dart';
import 'package:proceries/screens/CustomListView.dart';
import 'package:proceries/screens/widgets/CustomNavigationBar.dart';

class RecipesView extends StatefulWidget {

  @override
  _RecipesViewState createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  List<Recipe> recipes = List<Recipe>();

  @override
  Widget build(BuildContext context) {
    return CustomListView("Recipes", recipes, CustomNavigationBar(1));
  }
}
