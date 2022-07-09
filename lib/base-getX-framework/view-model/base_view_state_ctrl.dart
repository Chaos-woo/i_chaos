// ignore_for_file: unnecessary_overrides

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/mixin/delayed_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/smart_popup_mixin.dart';
import 'package:i_chaos/base-getX-framework/get-x/mixin/get_reference_mixin.dart';
import 'package:i_chaos/base-getX-framework/get-x/mixin/get_navigation_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/screen_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/toast_mixin.dart';

enum ViewState {
  init, // 初始化状态，例如成员属性的初始化
  readyInit, // 准备状态，该状态与loading状态进行区分，例如是否是状态的首次触发
  // ====大多数情况下在以下几种状态间互相转换======
  idle, // 无任何动作时的状态
  loading, // 忙碌状态，例如用户触发的网络请求、本地存储等
  empty, // 资源加载为空
  // =========================================
  dispose, // 资源销毁处理状态
  error, // 错误状态
  noNet, // 无网络状态
}

abstract class BaseViewStateCtrl extends GetxController
    with ToastMixin, SmartPopupMixin, ScreenMixin, DelayedMixin, GetXNavigationMixin, GetXReferenceMixin {
  // 当前状态
  ViewState _viewState = ViewState.idle;

  // 出错时的提示信息
  String? _errorMessage;

  @override
  void onInit() {
    super.onInit();
    _viewState = ViewState.init;
    onStateCtrlInit();
  }

  @override
  void onClose() {
    _viewState = ViewState.dispose;
    onStateCtrlDispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    _viewState = ViewState.readyInit;
    onBizDataHandle();
  }

  bool get isInit => _viewState == ViewState.init;

  bool get isReadyInit => _viewState == ViewState.readyInit;

  bool get isIdle => _viewState == ViewState.idle;

  bool get isLoading => _viewState == ViewState.loading;

  bool get isDispose => _viewState == ViewState.dispose;

  bool get isError => _viewState == ViewState.error;

  bool get isNoNet => _viewState == ViewState.noNet;

  bool get isEmpty => _viewState == ViewState.empty;

  String? get errorMessage => _errorMessage;

  // 更新指定id的监听controller的builder
  void updateListeners(List<String> ids) {
    update(ids);
  }

  // 更新监听controller的builder
  void updateListener() {
    update();
  }

  set viewState(ViewState value) {
    ViewState temp = _viewState;
    _viewState = value;
    if (stateUpdateViewPredicate(temp, _viewState)) {
      update();
    }
  }

  // 校验在更新controller状态时是否要同时更新视图view
  bool stateUpdateViewPredicate(ViewState pre, ViewState next) {
    return true;
  }

  void setLoading({bool? loading = true}) {
    _viewState = loading! ? ViewState.loading : ViewState.idle;
  }

  void setEmpty() {
    viewState = ViewState.empty;
  }

  void setError(String message) {
    _errorMessage = message;
    showToast(_errorMessage);
    viewState = ViewState.error;
  }

  void setNoNet({String? toast}) {
    _errorMessage = toast;
    showToast(toast);
    viewState = ViewState.noNet;
  }

  Future<bool> checkNet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.none;
  }

  @override
  String toString() {
    return 'BaseViewState{_viewState: $_viewState, _errorMessage: $_errorMessage}';
  }

  // 状态初始化处理
  void onStateCtrlInit();

  // 状态销毁前的处理
  void onStateCtrlDispose() {}

  // 状态业务处理
  void onBizDataHandle();
}
