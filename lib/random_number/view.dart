import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/random_number/consumer/random_consumer.dart';
import 'package:riverpod_test/random_number/initiator.dart';
import 'package:riverpod_test/second_page/view.dart';

// ignore: must_be_immutable
class RandomGeneratorView extends HookConsumerWidget {
  late IRandomNumberInitiator _initiator;
  RandomGeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build ');

    useEffect(() {
      _initiator = RandomNumberInitiator()..init(context);
      return () {
        _initiator.dispose();
      };
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RandomConsumer(),
            // Consumer to call a method inside StateNotifier just to change
            // the state
            RandomButton(onPressed: _initiator.randomNumber),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ));
              },
              child: const Text("Go To Second Page"),
            ),
          ],
        ),
      ),
    );
  }
}
