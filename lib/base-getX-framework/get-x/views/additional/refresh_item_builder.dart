import 'package:flutter/material.dart';

typedef ItemBuilder = Widget Function(BuildContext context, int index);

class RefreshListItemBuilder {
  final ItemBuilder builder;
  final int itemCount;

  RefreshListItemBuilder({
    required this.builder,
    required this.itemCount,
  });
}

typedef OnListScrollUpdate = void Function();
typedef OnListScrollEnd = void Function();
typedef OnListOverScroll = void Function();

class ListScrollListener {
  OnListScrollUpdate? onListScrollUpdate;
  OnListScrollEnd? onListScrollEnd;
  OnListOverScroll? onListOverScroll;

  ListScrollListener({
    this.onListScrollUpdate,
    this.onListScrollEnd,
    this.onListOverScroll,
  });
}
