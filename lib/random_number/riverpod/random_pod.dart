import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

// final randomNumberProvider =
//     ChangeNotifierProvider.autoDispose<RandomGenerator>(
//   (_) {
//     return RandomGenerator(Number());
//   },
// );

// class RandomGenerator extends ChangeNotifier {
//   final Number state;
//   RandomGenerator(this.state);

//   void generate() {
//     state.setNumberWithNotify(Random().nextInt(9999));
//     notifyListeners();
//   }
// }

final randomNumberProvider =
    StateNotifierProvider.autoDispose<RandomGenerator, Number>(
  (_) {
    return RandomGenerator(Number(0));
  },
);

class RandomGenerator extends StateNotifier<Number> {
  final Number num;
  RandomGenerator(this.num) : super(num);

  void generate() {
    state = Number(Random().nextInt(9999));
  }
}

class Number {
  final int num;
  Number(this.num);

  // int? _number = 0;

  // int? get number => _number;

  Number setNumber(int num) {
    return Number(num);
  }

  // setNumber(int state) {
  //   _number = state;
  // }

  // setNumberWithNotify(int state) {
  //   _number = state;
  // }
}
