import 'package:flutter/material.dart';

enum TitleAlignment { left, center, right }

class NavBarTitle {
  late List<String> titles;
  bool multiTitle = false;
  late TitleAlignment alignment;

  NavBarTitle.title(String? title, {bool? isCenter}) {
    titles = title != null ? [title] : [];
    alignment = (isCenter ?? true) ? TitleAlignment.center : TitleAlignment.left;
  }

  bool _hasTitle() {
    return titles.isNotEmpty;
  }

  String singleTitle() {
    return _hasTitle() ? titles[0] : '';
  }

  Alignment titleAlignment() {
    if (alignment == TitleAlignment.left) {
      return Alignment.centerLeft;
    } else if (alignment == TitleAlignment.right) {
      return Alignment.centerRight;
    } else {
      return Alignment.center;
    }
  }
}
