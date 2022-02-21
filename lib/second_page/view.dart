import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/random_number/view.dart';
import 'package:riverpod_test/second_page/initiator.dart';
import 'package:riverpod_test/second_page/model/user.dart';

// ignore: must_be_immutable
class SecondPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late AsyncValue<User> _user;
    late IUserInitiator _i;

    useEffect(() {
      _i = UserInitiator()..init(context);
      return () {
        _i.dispose();
      };
    });

    _user = _i.fetchUser(ref);

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _user.when(
              data: (user) => Column(
                children: [
                  Text(user.id.toString()),
                  SizedBox(height: 8),
                  Text(user.name),
                  SizedBox(height: 8),
                  Text(user.username),
                  SizedBox(height: 8),
                  Text(user.email),
                  SizedBox(height: 8),
                ],
              ),
              loading: CircularProgressIndicator.new,
              error: (e, s) => Text("Error while loading User"),
            ),
            SizedBox(height: 24),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => RandomGeneratorView(),
                  ),
                );
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
