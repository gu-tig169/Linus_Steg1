import 'package:flutter/material.dart';
import 'todo_cards.dart';
import 'Page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Checklist'),
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


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => Page2()));
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Row(children: [
          Text(
            widget.title,
          ),
          Container(
              margin: EdgeInsets.only(left: 5.0), child: Icon(Icons.check_box))
        ]),
      ),
      body: Column(
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
