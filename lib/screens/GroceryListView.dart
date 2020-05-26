import 'package:flutter/cupertino.dart';
import 'package:proceries/models/Ingredient.dart';
import 'package:proceries/screens/CustomListView.dart';
import 'package:proceries/screens/widgets/CustomNavigationBar.dart';

class GroceryListView extends StatefulWidget{
  @override
  _GroceryListViewState createState() => _GroceryListViewState();
}

class _GroceryListViewState extends State<GroceryListView> {
  List<Ingredient> ingredients = List<Ingredient>();

  @override
  Widget build(BuildContext context) {
    return CustomListView("Grocery List", ingredients, CustomNavigationBar(0));
  }
}