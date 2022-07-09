import 'package:i_chaos/base-getX-framework/get-x/ctrls/repeatable_all_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/ctrl_mixin_export.dart';

abstract class RepeatablePageStateCtrl<T> extends RepeatableAllStateCtrl<T>
    with DelayedMixin, ScreenMixin, GetXReferenceMixin {
  static int defaultPagingSize = 10; // 默认分页数量
  static int firstPage = 1; // 默认分页首页

  int pagingSize() => defaultPagingSize;

  // 当前页
  int currentPage = firstPage;

  Future<void> pagingLoadingData() async {
    try {
      if (await checkNetError()) {
        errorState();
      } else {
        loadingState();
        List<T> fetchData = await onLoadData(
          page: currentPage++,
          pageSize: pagingSize(),
        );
        if (isEmptyData(fetchData)) {
          emptyState();
          currentPage--;
          refreshController.loadNoData();
        } else {
          successState();
          originalDataList.addAll(fetchData);
          onRefreshLoadCompleted(originalDataList);
          refreshController.loadComplete();
        }
      }
      updateBuilder();
    } catch (e, s) {
      if (currentPage > firstPage) {
        currentPage--;
      }
      errorState();
      refreshController.loadFailed();
      onError(e, s);
    }
  }
}
