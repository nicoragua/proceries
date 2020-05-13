import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceries/models/Ingredient.dart';

class AddRecipeView extends StatefulWidget {
  @override
  _AddRecipeViewState createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  //TODO get from construction
  String name;

  List<Ingredient> ingredients = new List<Ingredient>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Title"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF2ED4B5),
                    Color(0xFF2F4241),
                  ])
          ),
        ),
      ),
      body: ListView(children: <Widget>[
        ListView.builder(
          itemCount: ingredients.length,
          itemBuilder: (c, i) {
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
            child: Text("Add Ingredient"),
            onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text("Ingredient Name"),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'name',
                            ),
                          ),
                          Text("Amount"),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'amount',
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DropdownButton(
                                  value: "total",
                                  items: <String>[
                                    "total",
                                    "gram",
                                    "mililiter"
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })),
      ]),
    );
  }
}
