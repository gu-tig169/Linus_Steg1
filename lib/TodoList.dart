import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TodoList extends StatefulWidget {
  final List<TodoCards> list;

  TodoList(this.list);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool checkBoxValue = false;

  Widget build(BuildContext context) {
    return Consumer<MyState>(builder: (context, state, child) => ListView.builder(
        itemBuilder: (context, index) => _cardItem(context, state.list[index]),
        itemCount: state.list.length,
        // children: widget.list.map((card) => _cardItem(context, card)).toList());
    ));
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