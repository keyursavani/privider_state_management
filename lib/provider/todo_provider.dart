import 'package:flutter/material.dart';
import 'package:provider_state_management/model/model_class.dart';
import 'package:provider_state_management/services/todo_services.dart';

class TodoProvider extends ChangeNotifier{
  final _service = TodoServices();
    bool isLoading = false;
    List<Todo> _todos = [];
    List<Todo> get todos => _todos;

    Future<void>  getAllTodo() async{
      isLoading = true;
      notifyListeners();

      final response =  await _service.getAll();

      _todos = response;
      isLoading = false;
      notifyListeners();
    }

}