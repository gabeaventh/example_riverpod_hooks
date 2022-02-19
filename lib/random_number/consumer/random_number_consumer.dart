import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/random_number/riverpod/random_pod.dart';

// ignore: must_be_immutable
class RandomNumberConsumer extends ConsumerWidget {
  int _count = 0;
  RandomNumberConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this print to show that the widget
    // is rebuilds the widget every time the state changes
    debugPrint("${_count++}");
    Number _number = ref.watch(randomNumberProvider);
    // Number _number = ref.watch(randomNumberProvider).state;

    return Text(
      _number.num.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
