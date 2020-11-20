import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/TodoListView.dart';
import 'package:test_app/model.dart';
import 'todo_cards.dart';
import 'Page2.dart';
import 'package:provider/provider.dart'; 
import 'model.dart';

/*
void main() {
  runApp(MyApp());
}*/

void main() {
  var state = MyState();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child:
    MyApp()
    )
  );
}      //Framtida ChangeNotifierProvider version

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        unselectedWidgetColor: Colors.white,
      ),
      home: TodoListView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  // [sak1, sak2] lista
  // {} map/dictionary

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Test för att göra nån sorts provider som i en av Mattias videos, originalet finns längre ner
//men får error när jag försöker pressa in TodoCards
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newCard = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Page2(
                //TodoCards(todo:  )
              )
          ));
          Provider.of<MyState>(context).addCard(newCard);
        }),

     
     
      /*floatingActionButton: FloatingActionButton(                     //FLytande knapp för att resa till page2
        backgroundColor: Colors.cyan,
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => Page2()));
        },
        child: Icon(Icons.add),
      ),*/

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Row(children: [
          Text(
           'Checklist',
           style: GoogleFonts.tauri(textStyle: TextStyle(fontSize: 30)),
           // widget.title,
          ),
          Container(
              margin: EdgeInsets.only(left: 5.0), 
              child: Icon(Icons.check_box, size: 30.0,)
              )
        ]),
      ),
      
      body: ListView(
        dragStartBehavior: DragStartBehavior.start, //försök till att göra cards flyttbara, fungerar ej ¯\_(ツ)_/¯
        children: [
          TodoCard(todo: '1'),
          TodoCard(todo: '2'),
          TodoCard(todo: '3'),
          TodoCard(todo: '4'),
        ],
      ),
    );
  }
}
