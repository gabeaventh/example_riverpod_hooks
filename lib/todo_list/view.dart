import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/todo_list/initiator.dart';
import 'package:riverpod_test/todo_list/riverpod/todos_pod.dart';

// ignore: must_be_immutable
class TodosView extends HookConsumerWidget {
  late ITodoListInitiator _i;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _todoList = ref.watch(filteredTodoListProvider);

    useEffect(() {
      _i = TodoListInitiator()..init(context);
      return () {
        _i.dispose();
      };
    });
    _i.fetchTodoList(ref);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        bottom: TabBar(
          controller: _i.tabController,
          onTap: (index) {
            _i.changeFilter(ref, index);
          },
          tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Active',
            ),
            Tab(
              text: 'Completed',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _i.tabController,
        children: [
          ListView(
            children: [
              if (_todoList.length == 0) ...{
                Center(
                  child: Text('No Todos'),
                )
              },
              for (var i = 0; i < _todoList.length; i++) ...{
                ListTile(
                  title: Text(_todoList[i].title ?? ""),
                  subtitle: Text(_todoList[i].completed.toString()),
                ),
              }
            ],
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
