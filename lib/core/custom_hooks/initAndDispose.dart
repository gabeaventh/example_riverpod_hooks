import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useInitAndDispose(
  ValueChanged<BuildContext> init,
  VoidCallback dispose,
) {
  useEffect(() {
    init(useContext());
    return () {};
  }, []);
  useEffect(() => () => dispose(), []);
}
