import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useInitAndDispose(
  void init,
  VoidCallback dispose,
) {
  useEffect(() {
    init;
    return null;
  }, []);
  useEffect(() => () => dispose(), []);
}
