import 'dart:convert';

import 'package:todo_app/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos/";
  final String addurl = "https://dummyjson.com/todos/";

  Future<List<Todo>> getUncompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    for (var element in resp) {
      Todo task = Todo.fromJson(element);

      if (task.completed! == false) {
        todos.add(task);
      }
    }

    return todos;
  }

  Future<List<Todo>> getCompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    for (var element in resp) {
      Todo task = Todo.fromJson(element);

      if (task.completed! == true) {
        todos.add(task);
      }
    }

    return todos;
  }

  Future<String> addTodo(Todo newTodo) async {
    final response = await http.post(Uri.parse(addurl),
        headers: <String, String>{
          "Content-type": "application/json; charset=UTF-8"
        },
        body: json.encode(newTodo.toJson()));
    // ignore: avoid_print
    print(response.body);
    return response.body;
  }
}
