import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/core/core_initiatore.dart';
import 'package:riverpod_test/second_page/model/user.dart';
import 'package:riverpod_test/second_page/riverpod/user_pod.dart';

abstract class IUserInitiator extends CoreInitiator {
  AsyncValue<User> fetchUser(WidgetRef ref);
}

class UserInitiator implements IUserInitiator {
  @override
  AsyncValue<User> fetchUser(WidgetRef ref) {
    return ref.watch(userProvider);
  }

  @override
  dispose() {}

  @override
  init(BuildContext context) {}
}
