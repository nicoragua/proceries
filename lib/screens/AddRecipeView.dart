import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceries/models/Ingredient.dart';

class AddRecipeView extends StatefulWidget{
  @override
  _AddRecipeViewState createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {

  //TODO get from construction
  String name;

  List<Ingredient> ingredients = new List<Ingredient>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(50,14, 102, 85),
        ),
        body: ListView(
          children: <Widget>[
            ListView.builder(
              itemCount: ingredients.length,
              itemBuilder:  (c, i){
                return Card(
                  child: ListTile(
                    onTap: () {},
                    title: Text(ingredients[i].name),
                  ),
                );
              },
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            ),
            FlatButton(
              onPressed: () {
                //TODO Add Ingredient
              },
              child: Text(
                "Add Ingredient",
              ),
            ),
          ]
        ),
      ),
    );
  }
}