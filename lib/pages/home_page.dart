import 'package:f_202010_todo_class/model/todo.dart';
import 'package:f_202010_todo_class/pages/Dialog_page.dart';
import 'package:f_202010_todo_class/pages/Dropdown_page.dart';
import 'package:flutter/material.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _list(){
      return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return _item(element, posicion);
      },
    );
  }

  Widget _item(Todo element, int posicion){
         return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  todos.removeAt(posicion);
                });
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(25.0),
            child: Text("Delete",
              style: TextStyle(color: Colors.white),
            ),
          ),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: _getResource(element.type),
                  title: Text(element.title),
                  subtitle: Text(element.body),
                  isThreeLine: true,
                  onTap:(){
                    setState(() {
                      	if (todos[posicion].completed == 0) {
                          todos[posicion].completed = 1;
                        }else{
                          todos[posicion].completed = 0;
                        } 
                    });
                  },
                ),
              ],
            ),
            color: element.completed == 1 ? Colors.blueGrey : Colors.yellow[200],
            ),
        );
  }

  void _addTodo() async{
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context){
        return NewTodoDialog();
      }, 
    );
    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  Widget _getResource(String type){
    switch(type){
      case "Call":
        return Icon(Icons.call, size: 72.0);
      case "Home_Work": 
        return Icon(Icons.contacts, size: 72.0);
      default: 
        return Icon(Icons.check, size: 72.0);
    }

  }
  /*
   setState(() {
      todos.add(new Todo(title:"itemT", body: "itemB", completed: 0 ));
    });
  */ 

}