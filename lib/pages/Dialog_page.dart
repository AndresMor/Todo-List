import 'package:f_202010_todo_class/pages/Dropdown_page.dart';
import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/model/todo.dart';

class NewTodoDialog extends StatefulWidget{
  @override 
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog>{
  final _formKey = GlobalKey<FormState>();
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  String _dropSelected = "DEFAULT";
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      title: Text(
        'New todo',
        style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20.0),
      ),
      content: Container(
        child: SingleChildScrollView(
          child:   Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: controllerTitle,
                      decoration: InputDecoration(labelText: 'Title'),
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please fill the fields';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controllerBody,
                      decoration: InputDecoration(labelText: 'Body'),
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please fill the fields';
                        }
                        return null;
                      },
                    ),
                 
                    TodoTypeDropdown(
                      selected: _dropSelected, 
                      onChangedValue: (value) => setState((){
                        _dropSelected = value;
                      }),
                    )
                  ],
                ),
                
              ),
          ],),
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          Navigator.of(context).pop();
        }, 
        child: Text('Cancel')),
        FlatButton(
          onPressed: () {
            if(_formKey.currentState.validate()){
              final todo = new Todo(
                 title: controllerTitle.value.text,
                 body: controllerBody.value.text,
                  completed: 0,
                  type: _dropSelected,
               );
               controllerTitle.clear();
               controllerBody.clear();
               Navigator.of(context).pop(todo);
           }
         },
         child: Text('Submit'),
        ),
      ],

    
    );
  }
}