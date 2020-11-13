import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'todo_cards.dart';

class Page2 extends StatelessWidget {
  // @Overide
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPage2(title: 'Add to checklist'),
    );
  }
}

class MyPage2 extends StatefulWidget {
  MyPage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPage2State createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Row(children: [
          Text(
            widget.title,
          ),
          Container(
              margin: EdgeInsets.only(left: 5.0), child: Icon(Icons.input))
        ]),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: TextField(
              decoration: InputDecoration(hintText: 'Tap here to add'),
            ),
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: [BoxShadow(blurRadius: 6.0)]),
          )
        ],
      ),
    );
  }
}
