
abstract class StatefulViewLifeCycle {
  // 视图资源初始化
  void initViewRes();

  // 依赖初始化
  void initViewReference();

  // StatefulWidget#initState()
  void initViewState();

  // 销毁预处理
  void preDispose();
}