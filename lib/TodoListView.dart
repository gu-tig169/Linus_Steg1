import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/AddTodoViewState.dart';
import 'package:test_app/model.dart';
import 'package:provider/provider.dart';

import 'TodoList.dart';

class TodoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        actions: [
          Container(
            
            child: PopupMenuButton(
                
                onSelected: (value) {
                  Provider.of<MyState>(context, listen: false).setFilterBy(value);
                },
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem(
                        child: Text('All'),
                        value: 'all',
                      ),
                      const PopupMenuItem(
                        child: Text('Checked'),
                        value: 'checked',
                      ),
                      const PopupMenuItem(
                        child: Text('Unchecked'),
                        value: 'unchecked',
                      )
                    ]),
                    decoration: 
            BoxDecoration(
              color: Colors.green[500],
              border: Border(
               left: BorderSide(color: Colors.green[300], width: 1, style: BorderStyle.solid),
              
            )),
          )
        ],
        title: Row(
          children: [
            Text(
              'Checklist',
              style: GoogleFonts.tauri(textStyle: TextStyle(fontSize: 30)),
            ),
            Container(
                margin: EdgeInsets.only(left: 5.0),
                child: Icon(Icons.check_box, size: 30.0))
          ],
        ),
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
        onPressed: () async {
          var newCard = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTodoView(TodoCards(todo: ''))));

          if (newCard != null) {
            Provider.of<MyState>(context, listen: false).addCard(newCard);
          }
        },
      ),
    );
  }

  List<TodoCards> _filterList(list, filterBy) {
    if (filterBy == 'all') return list;
    if (filterBy == 'checked')
      return list
          .where((item) => item.checked == true)
          .toList(); //testat card istället för item, fungerade inte
    if (filterBy == 'unchecked')
      return list.where((item) => item.checked == false).toList();
    return null;
  }
}

//ctrl+y

class AddTodoView extends StatefulWidget {
  final TodoCards card;

  AddTodoView(this.card);

  @override
  State<StatefulWidget> createState() {
    return AddTodoViewState(
        card); //this.todo tar bort error, oklart om det är korrekt
  }
}
