import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/random_number/riverpod/random_pod.dart';

abstract class IRandomNumberInitiator {
  void init(BuildContext context);
  void dispose();
  void randomNumber(WidgetRef ref);
}

class RandomNumberInitiator implements IRandomNumberInitiator {
  @override
  void init(BuildContext context) {
    debugPrint("First Init");
  }

  @override
  void dispose() {
    debugPrint("Page Got Disposed");
  }

  @override
  void randomNumber(WidgetRef ref) {
    ref.read(randomNumberProvider.notifier).generate();
  }
}
