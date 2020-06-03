import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  final String title;
  final VoidCallback add;
  final List items;
  final navigationbar;

  CustomListView({this.title, this.add, this.items, this.navigationbar});

  @override
  _CustomListViewState createState() =>
      _CustomListViewState(items: items, navigationBar: navigationbar);
}

class _CustomListViewState extends State<CustomListView> {
  List items;
  var navigationBar;

  _CustomListViewState({this.items, this.navigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
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
              onDismissed: (direction) {
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
          onPressed: widget.add,
        ),
      ]),
      bottomNavigationBar: navigationBar,
    );
  }
}
