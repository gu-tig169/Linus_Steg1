import 'package:flutter/material.dart';

class TodoCards {
  String todo;
  bool checked;
  String id = '';

  TodoCards({this.todo, this.checked = false, this.id});

  factory TodoCards.fromJson(Map<String, dynamic> json) {
    return TodoCards(
      todo: json['title'],
      checked: json['done'],
      id: json['sd9f9s8df9s8df9s'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TodoCards> _list = [];
  List<TodoCards> _displayedList = [];
  String _filterBy = 'all';

  void _updateDisplayedList() {
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

  String get filterBy => _filterBy;

  void addCard(TodoCards card) {
    _list.add(card);
    _updateDisplayedList();
  }

  void removeCard(TodoCards card) {
    _list.remove(card);
    _updateDisplayedList();
  }

  void setCheckbox(TodoCards card, bool checked) {
    _list[_list.indexOf(card)].checked = checked;
    _updateDisplayedList();
  }

  List<TodoCards> get list => _displayedList;

  void setFilterBy(String value) {
    _filterBy = value;
    _updateDisplayedList();
  }
}
