import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/random_number/riverpod/random_pod.dart';

// ignore: must_be_immutable
class RandomConsumer extends ConsumerWidget {
  int _count = 0;
  RandomConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("${_count++}");
    Number _number = ref.watch(randomNumberProvider);
    // Number _number = ref.watch(randomNumberProvider).state;

    return Text(
      _number.num.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class RandomButton extends ConsumerWidget {
  final void Function(WidgetRef) onPressed;

  const RandomButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("RandomButton");
    return Consumer(
      builder: (context, watch, _) {
        return ElevatedButton(
          child: const Text('Random'),
          onPressed: () => onPressed(ref),
        );
      },
    );
  }
}
