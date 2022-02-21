import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/core/core_initiator.dart';
import 'package:riverpod_test/todo_list/riverpod/filter_pod.dart';
import 'package:riverpod_test/todo_list/riverpod/todos_pod.dart';

abstract class ITodoListInitiator extends CoreInitiator {
  TabController get tabController;

  Future<void> fetchTodoList(WidgetRef ref);
  void changeFilter(WidgetRef ref, int index);
}

class TodoListInitiator implements ITodoListInitiator {
  @override
  Future<void> fetchTodoList(WidgetRef ref) {
    /// O(1)
    return ref.read(todoListProvider.notifier).fetchTodos();
  }

  @override
  dispose() {}

  @override
  init(BuildContext context) {}

  @override
  void changeFilter(WidgetRef ref, int index) {
    /// O(2)
    switch (index) {
      case 1:
        ref.read(filterProvider.notifier).state = Filter.completed;
        break;
      case 2:
        ref.read(filterProvider.notifier).state = Filter.uncompleted;
        break;
      default:
        ref.read(filterProvider.notifier).state = Filter.all;
    }
  }

  @override
  TabController get tabController => useTabController(initialLength: 3);
}
