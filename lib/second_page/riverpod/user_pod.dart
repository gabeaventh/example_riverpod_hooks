import 'dart:math';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/second_page/model/user.dart';

final userProvider = FutureProvider.autoDispose<User>((ref) async {
  Response response;
  response = await Dio().get(
      'https://jsonplaceholder.typicode.com/users/${Random().nextInt(10)}');
  return User.fromJson(response.data);
});

class UserNotifier extends StateNotifier<User> {
  UserNotifier(User state) : super(state);
}
