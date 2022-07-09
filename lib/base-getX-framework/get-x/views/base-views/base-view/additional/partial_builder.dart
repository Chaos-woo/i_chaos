import 'package:flutter/material.dart';

typedef TinyStateBuilder = Widget Function(BuildContext tinyCtx, StateSetter stateSetter);

mixin PartialBuilder {
  Widget tinyStatefulBuilder(TinyStateBuilder builder) {
    return StatefulBuilder(
      builder: (BuildContext tinyCtx, StateSetter setState) =>
          builder.call(tinyCtx, setState),
    );
  }
}
