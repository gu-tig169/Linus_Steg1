import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app/';
const API_KEY = '6afa8b09-e6d9-4925-8d7a-55fba03150fd';

class Api {
  static Future addCard(TodoCards card) async {
    //print(card);
    var json = TodoCards.toJson(card);

    print(json);
    await http.post('${API_URL}todos?key=$API_KEY',
      body: json, headers: {'Content-Type': 'application/json'});
    print('Done');
  }

  static void deleteCard(TodoCards card) {
    http.delete('${API_URL}todos/${card.id}?key=$API_KEY');
  }

  //put / update
  static Future updateCard(TodoCards card) async {
    await http.put('${API_URL}todos/${card.id}?key=$API_KEY',
      body: TodoCards.toJson(card), headers: {'Content-Type': 'application/json'});
      
  }
  // remove

  static Future<List<TodoCards>> getCards() async {
    var response = await http.get('${API_URL}todos?key=$API_KEY');
    print(response.body);
    var json = jsonDecode(response.body);
    print(json);
    
    return json.map<TodoCards>((data) {
      return TodoCards.fromJson(data);
    }).toList();
  }
}
