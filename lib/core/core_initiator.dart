import 'package:flutter/material.dart';

abstract class CoreInitiator {
  // late final WidgetRef ref = useContext() as WidgetRef;
  init(BuildContext context);
  dispose();
}
