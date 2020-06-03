import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  final String title;
  List items;
  var navigationBar;
  VoidCallback add;

  CustomListView({this.title, this.items,this.navigationBar,this.add});

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List items;
  var navigationBar;
  VoidCallback add;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Widget.title),
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
            onPressed: add,
        ),
      ]),
      bottomNavigationBar: _navigationBar,
    );
  }
}

