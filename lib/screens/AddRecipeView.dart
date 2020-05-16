import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proceries/models/Ingredient.dart';

class AddRecipeView extends StatefulWidget {
  @override
  _AddRecipeViewState createState() => _AddRecipeViewState("Recipe Name");
}

class _AddRecipeViewState extends State<AddRecipeView> {
  String name;

  final nameController = TextEditingController();
  final amountController = TextEditingController();

  var items = ["pc.", "gram", "mililiter"];

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  List<Ingredient> ingredients = new List<Ingredient>();

  _AddRecipeViewState(String title) {
    this.name = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color(0xFFFFDF85),
                Color(0xFFE4A900),
              ])),
        ),
      ),
      body: ListView(children: <Widget>[
        ListView.builder(
          itemCount: ingredients.length,
          itemBuilder: (c, i) {
            return Card(
              child: ListTile(
                onTap: () {},
                title: Text(ingredients[i].toString()),
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
                  return SimpleDialog(
                    title: Text("New Ingredient"),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'name',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: TextField(
                                    controller: amountController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'amount',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: DropdownButton<String>(
                                    items:
                                        items.map((String dropDownStringItem) {
                                      return DropdownMenuItem<String>(
                                        value: dropDownStringItem,
                                        child: Text(dropDownStringItem),
                                      );
                                    }).toList(),
                                    value: items[0],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton(
                                  child: Text("Add"),
                                  onPressed: () {
                                    if (nameController.text != "" &&
                                        amountController.text != "") {
                                      setState(() {
                                        ingredients.add(new Ingredient(
                                            nameController.text,
                                            amountController.text));
                                      });
                                      nameController.clear();
                                      amountController.clear();
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                                FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                })),
      ]),
    );
  }
}
