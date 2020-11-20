import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'todo_cards.dart';

  class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: //Row(children: [
         Text("Add to Checklist",
          style: GoogleFonts.tauri(textStyle: TextStyle(fontSize: 20)),
           ),
          actions: [
           FlatButton(
             color: Colors.green[500], //knappfärg
             child: Row(
             children: [
               Text("Save",  //Icke fungerande sparknapp för nya ToDoCard
               style: GoogleFonts.tauri(textStyle: TextStyle(fontSize: 16, color: Colors.white)) //Knapptext uteseende
               ),
               Container(                            //Spar ikon
              margin: EdgeInsets.only(left: 5.0), 
              child: Icon(Icons.save, size: 20.0, color: Colors.white)
              )
             ],
           ),
          
            onPressed: () {
              Navigator.pop(context,
              TodoCard(
                todo: 'Test: Skapa TodoCard',
               // todo: todo, isChecked = false       Datorn blir ledsen 
              ));
            })
         ]
         // Text(
            //widget.title,
         // ),
          //Container(
             // margin: EdgeInsets.only(left: 5.0), child: Icon(Icons.input))
       // ]),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: TextField(
              style: GoogleFonts.tauri(
                 textStyle: TextStyle(fontSize: 16, color: Colors.black)),
              decoration: InputDecoration(hintText: '  Tap here to add', //slöa mellanslag för att få ut texten från vänsterkanten
               hintStyle: GoogleFonts.tauri(
                 textStyle: TextStyle(fontSize: 16, color: Colors.black))), 
            ),
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: [BoxShadow(blurRadius: 6.0)]),
          ),
          Container(
            margin: EdgeInsets.only( top: 140.0,),
            child: Icon(Icons.calendar_today_sharp, size: 250.0, color: Colors.green[50],)
          )
        ],
      ),
    );
  }
}
