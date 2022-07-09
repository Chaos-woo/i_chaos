abstract class ViewCtrlLifeCycle {
  // 状态初始化处理
  void onStateCtrlInit();

  // 状态销毁前的处理
  void onStateCtrlPreDispose() {}

  // 状态业务处理
  void onBizDataHandle();
}
