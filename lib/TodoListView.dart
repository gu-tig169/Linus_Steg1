import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/model.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
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
}

class TodoList extends StatefulWidget {
  final List<TodoCards> list;

  TodoList(this.list);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool checkBoxValue = false;

  Widget build(BuildContext context) {
    return ListView(
        children: widget.list.map((card) => _cardItem(context, card)).toList());
  }

  Widget _cardItem(context, card) {
    //return CheckboxListTile(value: false, onChanged: null,
    //controlAffinity: ListTileControlAffinity.leading,
    return Container(
      margin: EdgeInsets.only(top: 12.0, left: 4.0, right: 4.0),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 3.0)],
          color: Colors.green[500],
          ),
      child: CheckboxListTile(
        
        value: card.checked,
        onChanged: (bool checkBoxValue) {
          var state = Provider.of<MyState>(context, listen: false);
          state.setCheckbox(card, checkBoxValue);
          
        },
        activeColor: Colors.green[500], 
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(card.todo, 
            style: GoogleFonts.tauri(
                textStyle: TextStyle(fontSize: 18, color: Colors.white,))),
        secondary: IconButton(
            icon: Icon(Icons.delete, color: Colors.white,),
          

            onPressed: () {
              var state = Provider.of<MyState>(context, listen: false);
              state.removeCard(card);
            }), //removeCard här
      ),
    );

    /* return  ListTile(
      
      title: Text(card.todo));*/
  }
}

class AddTodoView extends StatefulWidget {
  final TodoCards card;

  AddTodoView(this.card);

  @override
  State<StatefulWidget> createState() {
    return AddTodoViewState(
        card); //this.todo tar bort error, oklart om det är korrekt
  }
}

class AddTodoViewState extends State<AddTodoView> {
  String todo;

  TextEditingController textEditingController;

  AddTodoViewState(TodoCards card) {
    this.todo = card.todo;

    textEditingController = TextEditingController(text: card.todo);

    textEditingController.addListener(() {
      todo = textEditingController.text;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Add to Checklist',
              style: GoogleFonts.tauri(textStyle: TextStyle(fontSize: 20)),
            ),
            backgroundColor: Colors.green[700],
            actions: [
              FlatButton(
                  color: Colors.green[500],
                  child: Row(
                    children: [
                      Text('Save',
                          style: GoogleFonts.tauri(
                              textStyle: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                      Container(
                          //Spar ikon
                          margin: EdgeInsets.only(left: 5.0),
                          child:
                              Icon(Icons.save, size: 20.0, color: Colors.white))
                    ],
                  ),
                  onPressed: () {
                    Navigator.pop(context, TodoCards(todo: todo));
                  })
            ]),
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: TextField(
              cursorColor: Colors.black,
              textCapitalization: TextCapitalization.sentences,
              style: GoogleFonts.tauri(
                  textStyle: TextStyle(fontSize: 16, color: Colors.black)),
              decoration: InputDecoration(
                  hintText:
                      '  Tap here to add', //slöa mellanslag för att få ut texten från vänsterkanten ¯\_(ツ)_/¯
                  hintStyle: GoogleFonts.tauri(
                      textStyle: TextStyle(fontSize: 16, color: Colors.black))),
                      
              controller: textEditingController,
            ),
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: [BoxShadow(blurRadius: 6.0)]),
          ),
          Container(
              margin: EdgeInsets.only(
                top: 140.0,
              ),
              child: Icon(
                Icons.assignment,
                size: 250.0,
                color: Colors.green[50],
              ))
        ]));
  }
}
