import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/second_page/model/user.dart';

final userProvider = FutureProvider.autoDispose<User>((ref) async {
  Response response;
  response = await Dio().get(
      'https://jsonplaceholder.typicode.com/users/${Random().nextInt(10)}');
  debugPrint(response.data.toString());
  return User.fromJson(response.data);
});
