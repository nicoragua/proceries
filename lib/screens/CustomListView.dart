import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceries/screens/widgets/AddRecipeDialog.dart';

class CustomListView extends StatefulWidget {
  final String title;
  final List items;
  final _navigationBar;
  final VoidCallback add;

  CustomListView(this.title, this.items,this._navigationBar,this.add);

  @override
  _CustomListViewState createState() => _CustomListViewState(title,items,_navigationBar,add);
}

class _CustomListViewState extends State<CustomListView> {
  String title;
  List items;
  var _navigationBar;
  VoidCallback add;

  _CustomListViewState(this.title, this.items, this._navigationBar,this.add);

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
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (direction)  {
                  setState(() {
                    items.removeAt(i);
                  });
              },
              child: Card(
                child: ListTile(
                      onTap: () {},
                      title: Text(items[i].toString()),
                    ),
                ),
            );
          },
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
        ),
        FlatButton(
            child: Text("Add"),
            onPressed: _add,
        ),
      ]),
      bottomNavigationBar: _navigationBar,
    );
  }
}

