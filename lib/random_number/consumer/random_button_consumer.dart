import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RandomButton extends ConsumerWidget {
  final ValueChanged<WidgetRef> onPressed;

  RandomButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this print to show entire Widget only builds once

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
