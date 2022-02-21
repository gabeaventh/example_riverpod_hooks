import 'package:freezed_annotation/freezed_annotation.dart';

part 'todos.freezed.dart';
part 'todos.g.dart';

@freezed
class Todos with _$Todos {
  factory Todos(List<Todo> todos) = _Todos;

  factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);

  static Todos parseList(List<dynamic> json) {
    return Todos(
      // ignore: unnecessary_lambdas
      json.map((e) => Todo.fromJson(e)).toList(),
    );
  }
}

@freezed
class Todo with _$Todo {
  factory Todo({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  static List<Todo> parseList(List<dynamic> json) {
    // ignore: unnecessary_lambdas
    return List<Todo>.from(json.map((e) => Todo.fromJson(e)));
  }
}
