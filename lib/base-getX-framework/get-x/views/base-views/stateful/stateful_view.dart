import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/base_view.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/stateful/stateful_view_life_cycle.dart';

typedef StatefulCtrlBuilder = Widget Function<T>(T ctrl);

abstract class StatefulView extends BaseView implements StatefulViewLifeCycle {}
