import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceries/models/Recipe.dart';
import 'package:proceries/screens/widgets/AddRecipeDialog.dart';
import 'package:proceries/screens/widgets/CustomNavigationBar.dart';

import 'CustomListView.dart';

class AddRecipeView extends StatefulWidget {
  Recipe recipe;

  AddRecipeView(this.recipe);

  @override
  _AddRecipeViewState createState() => _AddRecipeViewState(recipe);
}

class _AddRecipeViewState extends State<AddRecipeView> {
  Recipe recipe;

  final _nameController = new TextEditingController();
  final _amountController = new TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  _AddRecipeViewState(this.recipe);

  @override
  Widget build(BuildContext context) {
    return CustomListView(
        title: recipe.name,
        items: recipe.ingredients,
        navigationbar: CustomNavigationBar(2),
        add: () => showDialog(
            context: context,
            builder: (context) {
              return AddRecipeDialog(
                nameController: _nameController,
                amountController: _amountController,
                ingredients: recipe.ingredients,
                onClose: () {
                  setState(() {});
                },
              );
            }));
  }
}
