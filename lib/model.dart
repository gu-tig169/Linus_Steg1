import 'package:flutter/material.dart';

class TodoCards {
  String todo;
  bool checked;

  TodoCards({this.todo, this.checked = false});
}

class MyState extends ChangeNotifier {
  List<TodoCards> _list = [];

  List<TodoCards> get list => _list;

  void addCard(TodoCards card) {
    _list.add(card);
    notifyListeners();
  }

  void removeCard(TodoCards card) {
    _list.remove(card);
    notifyListeners();
  }

  void setCheckbox(TodoCards card, bool checked) {
    card.checked = checked;
    notifyListeners();
  }
}
