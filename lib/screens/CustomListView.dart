import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceries/screens/widgets/AddRecipeDialog.dart';

class CustomListView extends StatefulWidget {
  String title;
  List items;
  var _navigationBar;

  CustomListView(this.title, this.items,this._navigationBar);

  @override
  _CustomListViewState createState() => _CustomListViewState(title,items,_navigationBar);
}

class _CustomListViewState extends State<CustomListView> {
  String title;
  List items;
  var _navigationBar;

  var icon = Icon(Icons.delete);

  final _nameController = new TextEditingController();
  final _amountController = new TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  _CustomListViewState(this.title, this.items, this._navigationBar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
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
          itemCount: items.length,
          itemBuilder: (c, i) {
            return Card(
              child: ListTile(
                    onTap: () {},
                    title: Text(items[i].toString()),
                    trailing: FlatButton(
                      child: icon,
                      onPressed: () {
                        setState(() {
                          items.removeAt(i);
                        });
                      },
                    ),
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
                  return AddRecipeDialog(
                    nameController: this._nameController,
                    amountController: this._amountController,
                    ingredients: this.items,
                    onClose: () {
                      setState(() {});
                    },
                  );
                })),
      ]),
      bottomNavigationBar: _navigationBar,
    );
  }
}

