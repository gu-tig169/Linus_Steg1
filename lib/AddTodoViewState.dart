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
      backgroundColor: Color(0xFFd1e5d9),
        appBar: AppBar(
            title: Text(
              'Add to Checklist',
              style: GoogleFonts.tauri(textStyle: TextStyle(fontSize: 20),
              color: Color(0xFFdcd2bb)),
            ),
            backgroundColor: Color(0xFF1c3b33),
            actions: [
              Container(
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, TodoCards(todo: todo));
                  },
                  color: Color(0xFF737e62),
                  child: Row(
                    children: [
                      Text('Save',
                        style: GoogleFonts.tauri(
                          textStyle: TextStyle(
                            fontSize: 16, color: Color(0xFFdcd2bb)
                          )
                        )
                      ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child:  Icon(
                        Icons.save, 
                        size: 20.0, 
                        color: Color(0xFFdcd2bb)
                      )
                    )
                  ],
                  ),
                ),
                  decoration: 
                BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Color(0xFFdcd2bb),
                      width: 1,
                      style: BorderStyle.solid
                    )
                  )
                ),
              ),
            ],
            iconTheme: IconThemeData(
              color: Color(0xFFddcfbc) //Färg på tillbakaknapp
            )
          ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10, 
              top: 5
            ),
            child: TextField(
              controller: textEditingController,
              cursorColor: Color(0xFFdcd2bb),
              textCapitalization: TextCapitalization.sentences,
              style: GoogleFonts.tauri(
                textStyle: TextStyle(
                  fontSize: 16, 
                  color: Color(0xFFdcd2bb)
                )
              ),
              decoration: InputDecoration(
                hintText: '  Tap here to write - then save', //Några slöa mellanslag för att få ut texten från kanten
                hintStyle: GoogleFonts.tauri(
                  textStyle: TextStyle(
                    fontSize: 16, 
                    color: Color(0xFFdcd2bb)
                  )
                )
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF19342d), 
              boxShadow: [BoxShadow(blurRadius: 6.0)]
            ),
          ),
          Expanded(
            child: Container( //Bakrundsikon på sida 2
              margin: EdgeInsets.only(
                top: 80.0,
              ),
              child: Icon(
                Icons.assignment,
                size: 250.0,
                color: Color(0xFF19342d),
              )
            )
          )]
        )
      );
    }
  }

