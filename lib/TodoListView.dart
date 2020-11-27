import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/AddTodoViewState.dart';
import 'package:test_app/model.dart';
import 'package:provider/provider.dart';
import 'TodoList.dart';
import 'main.dart';

class TodoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            child: PopupMenuButton(
              color: Color(0xFFdcd2bb),
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
                },
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem(
                    child: Text('All'),
                    value: 'all'),
                  const PopupMenuItem(
                    child: Text('Checked'),
                    value: 'checked'),
                  const PopupMenuItem(
                    child: Text('Unchecked'),
                    value: 'unchecked')]
                      
              ),
            decoration:            
              BoxDecoration(
                color: Color(0xFF737e62),
                border: Border(
                  left: BorderSide(
                    color: Color(0xFFdcd2bb),
                     width: 1,
                      style: BorderStyle.solid),
                )
              ),
          )
        ],
        iconTheme: IconThemeData(
        color: Color(0xFFddcfbc)),
        backgroundColor: Color(0xFF1c3b33), //Colors.green[700],
        title: Row(
          children: [
            Text('Checklist',
              style: GoogleFonts.tauri(
                textStyle: TextStyle(fontSize: 30),
              color: Color(0xFFdcd2bb)),
            ),
          Container(
            margin: EdgeInsets.only(left: 5.0),
            child: Icon(Icons.check_box, size: 38.0,
            color: Color(0xFFdcd2bb)
            )
          )],
        ),
      ),
        
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.list),), 
      

      backgroundColor: Color(0xFFd1e5d9), //bakrundsfärg scaffold
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newCard = await Navigator.push(
            context,
              MaterialPageRoute(
                builder: (context) => AddTodoView(TodoCards(todo: '')
                )
              ));
          if (newCard != null) {
            Provider.of<MyState>(context, listen: false).addCard(newCard);
          }
        },
        backgroundColor: Color(0xFF1c3b33), //Färg på floatingB
        child: Icon(Icons.add,              //Plustecken på floating
          color: Color(0xFFdcd2bb),         //plustecken färg
        ),
      ),
    );
  }
}

class AddTodoView extends StatefulWidget {
  final TodoCards card;
  AddTodoView(this.card);

  @override
  State<StatefulWidget> createState() {
    return AddTodoViewState(
        card); 
  }
}

