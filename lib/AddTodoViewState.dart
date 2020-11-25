import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/TodoListView.dart';
import 'package:test_app/model.dart';

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
          Expanded(child: Container(
              margin: EdgeInsets.only(
                top: 140.0,
              ),
              child: Icon(
                Icons.assignment,
                size: 250.0,
                color: Colors.green[50],
              ))
    )]));
  }
}
