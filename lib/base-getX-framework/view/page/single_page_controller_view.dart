import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/view-model/single_view_state_ctrl.dart';

import 'base_page_controller_view.dart';

typedef StateViewBuilder<T> = Widget Function(T controller);

abstract class SinglePageControllerView<T extends SingleViewStateCtrl> extends BasePageControllerView<T> {
  SinglePageControllerView({Key? key}) : super(key: key);

  Widget simpleControllerStatusView(
    StateViewBuilder<T> builder, {
    Widget Function(String? error)? onError,
    Widget? onLoading,
    Widget? onEmpty,
    Color? backgroundColor,
  }) {
    Widget body = Container();
    if (controller.isReadyInit || controller.isLoading || controller.isInit) {
      body = onLoading ?? const Center(child: CircularProgressIndicator());
    } else if (controller.isError) {
      body = onError != null
          ? onError(controller.errorMessage)
          : Center(
              child: Text('A error occurred: ${controller.errorMessage}'),
            );
    } else if (controller.isEmpty) {
      body = onEmpty ?? const Center(child: Text('No Data'));
    } else {
      body = builder.call(controller);
    }

    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: body,
    );
  }
}
