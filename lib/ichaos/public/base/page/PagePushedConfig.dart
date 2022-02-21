
// ignore_for_file: file_names

import 'package:nested/nested.dart';

abstract class PagePushedConfig {
  // 标识向后续页面提供的ViewModelProvider
  List<SingleChildWidget>? viewModelMultiProviders();
}