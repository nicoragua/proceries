import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceries/models/Recipe.dart';
import 'package:proceries/screens/widgets/CustomNavigationBar.dart';

import 'CustomListView.dart';

class HomeView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Proceries",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      recipe.name, recipe.ingredients, CustomNavigationBar("TODO"),
    );
  }
}