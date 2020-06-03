import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceries/models/Ingredient.dart';
import 'package:proceries/models/Recipe.dart';
import 'package:proceries/screens/AddRecipeView.dart';
import 'package:proceries/screens/GroceryListView.dart';
import 'package:proceries/screens/RecipesView.dart';

class CustomNavigationBar extends StatefulWidget {
  int _isSelected;

  CustomNavigationBar(this._isSelected);

  @override
  _CustomNavigationBarState createState() =>
      _CustomNavigationBarState(_isSelected);
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex;

  _CustomNavigationBarState(this._selectedIndex);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => getView(index)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Groceries'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Recipes'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('New Recipe'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  //dummydata
  Recipe recipe = Recipe("Nudeln", new List<Ingredient>());

  Widget getView(int index) {
    switch (index) {
      case 0:
        return GroceryListView();
      case 1:
        return RecipesView();
      case 2:
        return AddRecipeView(recipe);
    }
  }
}
