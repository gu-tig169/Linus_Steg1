import 'main.dart';
import 'model.dart';
import 'package:flutter/material.dart';

class FilterOptions {
  static const String All = 'All';
  static const String Done = 'Done';
  static const String NotDone = 'Not Done';

  static const List<String> choices = <String>[All, Done, NotDone];
}