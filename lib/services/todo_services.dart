import 'dart:convert';

import 'package:provider_state_management/model/model_class.dart';
import 'package:http/http.dart' as http;

class TodoServices {
 Future<List<Todo>> getAll() async {
   const url = "https://jsonplaceholder.typicode.com/posts";
   final uri = Uri.parse(url);
   final response = await http.get(uri);
   if(response.statusCode == 200){
     final json = jsonDecode(response.body) as List;
     final todos = json.map((e) {
       return Todo(
           title: e['title'],
           id: e['id'],
           userId: e['userId'],
           // completed: e['completed']
       );
     }).toList();
     return todos;
   }
   return [];
   // throw "Something Went Wrong";
 }
}