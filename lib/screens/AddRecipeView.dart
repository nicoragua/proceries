import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proceries/models/Amount.dart';
import 'package:proceries/models/AmountTypes.dart';
import 'package:proceries/models/Ingredient.dart';

class AddRecipeView extends StatefulWidget {
  @override
  _AddRecipeViewState createState() => _AddRecipeViewState("Recipe Name");
}

class _AddRecipeViewState extends State<AddRecipeView> {
  String _name;

  final _nameController = new TextEditingController();
  final _amountController = new TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  List<Ingredient> ingredients = new List<Ingredient>();

  _AddRecipeViewState(String title) {
    this._name = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_name),
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
                  return MyDialog(
                    nameController: this._nameController,
                    amountController: this._amountController,
                    ingredients: this.ingredients,
                    onClose: () {
                      setState(() {
                      });
                    },
                  );
                })),
      ]),
    );
  }
}

class MyDialog extends StatefulWidget{

  final VoidCallback onClose;

  var nameController;
  var amountController;

  List<Ingredient> ingredients = new List<Ingredient>();

  MyDialog({@required this.ingredients, @required this.amountController, @required this.nameController, @required this.onClose});

  @override
  _MyDialogState createState() => _MyDialogState(
    ingredients: this.ingredients,
    amountController: this.amountController,
    nameController: this.nameController,
    onClose: this.onClose,
  );
}

class _MyDialogState extends State<MyDialog> {

  final VoidCallback onClose;

  var _items = AmountTypes.values;
  var _currentSelectedItem = AmountTypes.pc;

  var nameController;
  var amountController;

  List<Ingredient> ingredients = new List<Ingredient>();

  _MyDialogState({@required this.ingredients, @required this.amountController, @required this.nameController, @required this.onClose});

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButton<String>(
                      items:
                      _items.map((AmountTypes dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem.name,
                          child: Text(dropDownStringItem.name),
                        );
                      }).toList(),
                      onChanged: (String newSelectedItem) {
                        setState(() {
                          this._currentSelectedItem = _currentSelectedItem.getValue(newSelectedItem);
                        });
                      },
                      value: _currentSelectedItem.name,
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
                              new Amount(amountController.text, _currentSelectedItem)));
                        });
                        nameController.clear();
                        amountController.clear();
                        Navigator.pop(context);
                        onClose();
                      }
                    },
                  ),
                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      nameController.clear();
                      amountController.clear();
                      _currentSelectedItem = AmountTypes.pc;
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
  }
}
