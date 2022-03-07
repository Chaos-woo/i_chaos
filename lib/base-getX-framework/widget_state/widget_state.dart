import 'package:i_chaos/base_framework/widget_state/base_state.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';

export 'package:i_chaos/base_framework/extension/size_adapter_extension.dart';

/// * 如果是页面，继承 [PageState]
/// * 如果是view，继承 [WidgetState]
///
/// 此处扩展功能 应该只与 view相关

abstract class WidgetState extends BaseState with WidgetGenerator {
  ///刷新widget sate
  refreshState({Function? task}) {
    if (mounted) {
      setState(task == null ? () {} : task());
    }
  }
}
