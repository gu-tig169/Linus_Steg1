import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoCard extends StatefulWidget {
  String todo;
  bool isChecked = false;

  TodoCard({todo}) {
    this.todo = todo;
  }

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 6.0, left: 4.0, right: 4.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 4.0)], color: Colors.white),
        child: Row(children: [
          Checkbox(
              value: widget.isChecked,
              onChanged: (bool value) {
                setState(() {
                  widget.isChecked = value;
                });
              }),
          Text("${widget.todo} ToDo",
              style: GoogleFonts.tauri(textStyle: TextStyle(fontSize: 36))
              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
        ]));
  }
}
