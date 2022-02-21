import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Filter {
  all,
  completed,
  uncompleted,
}

final filterProvider = StateProvider((_) => Filter.all);
