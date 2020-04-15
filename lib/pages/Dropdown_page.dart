import 'package:flutter/material.dart';

class TodoTypeDropdown extends StatelessWidget{
  final String selected;
  final ValueChanged<String> onChangedValue;
  
  const TodoTypeDropdown({Key key, @required this.selected, @required this.onChangedValue}):super(key:key);
  
  
  @override 
  Widget build(BuildContext context){
  return DropdownButton<String>(
    value: this.selected,
    icon: Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: TextStyle(
      color: Colors.deepPurple
    ),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    onChanged: this.onChangedValue,
    items: <String>['DEFAULT', 'Call', 'Home_Work']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  );
  }
}

