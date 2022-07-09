
import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/mixin/delayed_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/smart_popup_mixin.dart';
import 'package:i_chaos/base-getX-framework/get-x/mixin/get_reference_mixin.dart';
import 'package:i_chaos/base-getX-framework/get-x/mixin/get_navigation_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/samrt_dialog_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/nav_bar_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/screen_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/toast_mixin.dart';

abstract class BaseStatelessView extends StatelessWidget
    with GetXReferenceMixin, GetXNavigationMixin, ToastMixin, SmartPopupMixin,
        DelayedMixin, SmartDialogMixin, ScreenMixin, NavBarMixin {

  BaseStatelessView({Key? key}) : super(key: key);
}