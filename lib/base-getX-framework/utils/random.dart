import 'dart:math';

class RandomUnit {
  static final _random = Random(DateTime.now().millisecondsSinceEpoch);

  static int nextInt(int minVal, int maxVal) => minVal + _random.nextInt(maxVal - minVal);

  static double nextDouble(double minVal, double maxVal) {
    double _tempDoubleVal = minVal + _random.nextDouble();
    return min(_tempDoubleVal, maxVal);
  }

  static bool nextBool() => _random.nextBool();
}