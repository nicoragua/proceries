import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  var _isSelected;

  CustomNavigationBar(this._isSelected);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState(_isSelected);
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  var _isSelected;

  _CustomNavigationBarState(this._isSelected);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Recipes'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Groceries'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('School'),
        ),
      ],
    );
  }
}
