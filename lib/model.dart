import 'dart:convert';

import 'package:flutter/material.dart';
import 'api.dart';

class TodoCards {
  String todo;
  bool checked;
  String id;

  TodoCards({this.todo, this.checked = false, this.id = ''});

  static String toJson(TodoCards card) {
    return jsonEncode(<String, dynamic>{
      'id': card.id,
      'title': card.todo,
      'done': card.checked
    });
  }

  factory TodoCards.fromJson(Map<String, dynamic> json) {
    return TodoCards(
        id: json['id'], todo: json['title'], checked: json['done']);
  }
}

class MyState extends ChangeNotifier {
  MyState() {
    _updateDisplayedList();
  }
  List<TodoCards> _list = [];
  List<TodoCards> _displayedList = [];
  String _filterBy = 'all';
  List<TodoCards> get list => _displayedList;

  void _updateDisplayedList() {
    // getList();
    //Filter
    switch (_filterBy) {
      case 'all':
        _displayedList = _list;
        break;
      case 'checked':
        _displayedList = _list.where((item) => item.checked).toList();
        break;
      case 'unchecked':
        _displayedList = _list.where((item) => !item.checked).toList();
        break;
      default:
        _displayedList = _list;
        break;
    }

    print(_displayedList); //debug felsök
    notifyListeners();
  }

  Future getList() async {
    List<TodoCards> list = await Api.getCards();
    _list = list;
    //_updateDisplayedList();
    notifyListeners();
    _updateDisplayedList(); //Utan denna så uppdateras inte auto listan vid omstart
  } 

  String get filterBy => _filterBy;

  void addCard(TodoCards card) async {
    await Api.addCard(card);
    await getList();
    notifyListeners();
  }

  void removeCard(TodoCards card) async {
    Api.deleteCard(card);
    _list.remove(card);
    notifyListeners();
  }

  void setCheckbox(TodoCards card, bool checked) async {
    Api.updateCard(card);
    card.checked = checked;
    notifyListeners();
  }

  void setFilterBy(String value) {
    _filterBy = value;
    _updateDisplayedList();
  }
}
