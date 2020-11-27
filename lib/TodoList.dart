import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'TodoListView.dart';

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
        // children: widget.list.map((card) => _cardItem(context, card)).toList()); //Fick det inte att fungera
      )
    );
  }

  Widget _cardItem(context, card) {     
   return Container (
     child: CheckboxListTile(                                      //Checkrutskort som kan checkas
      value: card.checked,
      onChanged: (checkBoxValue) {
        card.checked = checkBoxValue;
        Provider.of<MyState>(context, listen: false).setCheckbox(card);
      },

      activeColor: Color(0xFF1D3C34), //
      checkColor: Color(0xFFdcd2bb), //färgändring checkad checkbox
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
          card.todo, 
          style: GoogleFonts.tauri(
            textStyle: TextStyle(
              fontSize: 18, color: Color(0xFFDCD2BB),
              decoration: card.checked == true ? TextDecoration.lineThrough : null, //Streckad text när checkbox = true
            )
          )),
      secondary: IconButton(
        icon: Icon(Icons.delete, color: Color(0xFFdcd2bb)),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeCard(card);
        }
      ), //removeCard här
    ),
      margin: EdgeInsets.only(
        top: 12.0,
        left: 4.0,
        right: 4.0), 
      decoration: card.checked == true ? BoxDecoration(//För att ändra färg på todo när den är checked/klar
        boxShadow: [BoxShadow(blurRadius: 3.0)],
        color: Color(0xFF1d3c34),): BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 3.0)],
          color: Color(0xFF737e62)),
    );
  }
}