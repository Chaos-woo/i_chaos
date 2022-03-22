// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/mixin/get_x_dependency_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/get_x_navigation_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/magic-ww-dialog/magic_ww_dialog_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/pak_common_widget_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/screen_adapter_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/toast_mixin.dart';

// 提供给不需要controller的视图/组件使用
abstract class BaseStatefulView extends AbstractStatefulView with WidgetGenerator {
  @override
  void dispose() {
    super.dispose();
  }
}

abstract class AbstractStatefulView<T extends StatefulWidget> extends State<T>
    with GetXDependencyMixin, GetXNavigationMixin, ToastMixin, MagicWWDialogMixin, ScreenAdapterMixin, PakCommonWidget {
  @override
  void dispose() {
    super.dispose();
  }
}

mixin WidgetGenerator on AbstractStatefulView {
  ///为state生成 页面widget
  /// * 仅用于页面跳转生成widget
  /// * 用于生成页面内的widget 应使用[generateWidget]，否则可能会引起一些重建bug
  /// * 如通知、和悬浮窗依然使用此方法(其本质是页面)
  Widget transformToPageWidget({Key? key}) {
    return _CommonWidget(
      key: key,
      stateBuilder: () => this,
    );
  }

  ///为state 生成 widget
  /// * [StateBuilder] 用于回调生成一个新的state
  /// * 此方法生成的widget 为通用型widget
  /// * 相较于老版，用于解决 widget/state重建时出现的bug
  Widget generateWidget(StateBuilder stateBuilder, {Key? key}) {
    return _CommonWidget(
      key: key,
      stateBuilder: stateBuilder,
    );
  }
}

typedef StateBuilder = State Function();

class _CommonWidget extends StatefulWidget {
  final StateBuilder? stateBuilder;

  const _CommonWidget({Key? key, this.stateBuilder}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return stateBuilder!();
  }
}
