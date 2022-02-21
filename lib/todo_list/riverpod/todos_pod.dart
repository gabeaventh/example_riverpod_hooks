import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/todo_list/model/todos.dart';
import 'package:riverpod_test/todo_list/riverpod/filter_pod.dart';

class TodoList extends StateNotifier<List<Todo>> {
  TodoList(List<Todo>? initialTodos) : super(initialTodos ?? []);

  Future<void> fetchTodos() async {
    Response response;
    response =
        await Dio().get('https://jsonplaceholder.typicode.com/users/1/todos');
    List<Todo> todos = Todo.parseList(response.data);
    state = todos;
  }
}

final todoListProvider =
    StateNotifierProvider.autoDispose<TodoList, List<Todo>>((ref) {
  return TodoList([]);
});

final filteredTodoListProvider = Provider.autoDispose<List<Todo>>((ref) {
  final todoList = ref.watch(todoListProvider);
  final filter = ref.watch(filterProvider);

  switch (filter) {
    case Filter.all:
      return todoList;
    case Filter.completed:
      return todoList.where((todo) => todo.completed == false).toList();
    case Filter.uncompleted:
      return todoList.where((todo) => todo.completed == true).toList();
  }
});
