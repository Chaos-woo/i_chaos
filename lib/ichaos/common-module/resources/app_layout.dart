import 'package:flutter/material.dart';

class AppLayout {
  static final padding = _Padding();
  static final box = _Box();
}

class _Padding {
  final v2 = const EdgeInsets.symmetric(vertical: 2);
  final h2 = const EdgeInsets.symmetric(horizontal: 2);
  final all2 = const EdgeInsets.symmetric(vertical: 2, horizontal: 2);

  final v5 = const EdgeInsets.symmetric(vertical: 5);
  final h5 = const EdgeInsets.symmetric(horizontal: 5);
  final all5 = const EdgeInsets.symmetric(vertical: 5, horizontal: 5);

  final v10 = const EdgeInsets.symmetric(vertical: 10);
  final h10 = const EdgeInsets.symmetric(horizontal: 10);
  final all10 = const EdgeInsets.symmetric(vertical: 10, horizontal: 10);

  final v20 = const EdgeInsets.symmetric(vertical: 20);
  final h20 = const EdgeInsets.symmetric(horizontal: 20);
  final all20 = const EdgeInsets.symmetric(vertical: 20, horizontal: 20);

  final v40 = const EdgeInsets.symmetric(vertical: 40);
  final h40 = const EdgeInsets.symmetric(horizontal: 40);
  final all40 = const EdgeInsets.symmetric(vertical: 40, horizontal: 40);
}

class _Box {
  final none = const SizedBox(width: 0, height: 0);
}
