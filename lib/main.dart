import 'package:flutter/material.dart';
import 'package:test_app/TodoListView.dart';
import 'package:test_app/model.dart';
import 'package:provider/provider.dart';
import 'model.dart';

void main() {
  var state = MyState();
  state.getList();
  // state.getList();

  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        unselectedWidgetColor: Color(0xFFdcd2bb),
      ),
      home: TodoListView(),
    );
  }
}


