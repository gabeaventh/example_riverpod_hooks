import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/random_number/consumer/random_button_consumer.dart';
import 'package:riverpod_test/random_number/consumer/random_number_consumer.dart';
import 'package:riverpod_test/random_number/initiator.dart';
import 'package:riverpod_test/second_page/view.dart';

// ignore: must_be_immutable
class RandomGeneratorView extends HookConsumerWidget {
  late IRandomNumberInitiator _initiator;
  RandomGeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this print to show entire Widget/View only builds once
    debugPrint('build ');

    // Init the initiator
    // and dispose it using hooks useEffect
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
            // this is the only widget that is rebuilt
            // every time the state changes
            RandomNumberConsumer(),
            // Consumer to call a method inside StateNotifier just to change
            // the state of the Number
            RandomButton(onPressed: _initiator.randomNumber),

            // this page is only to display
            // that this page is got dispossed
            // then re initiated when the page is revisited
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ));
              },
              child: Text("Go To Second Page"),
            ),
          ],
        ),
      ),
    );
  }
}
