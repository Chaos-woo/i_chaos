import 'package:i_chaos/base-getX-framework/view-model/handle/exception_handler.dart';

import 'list_view_state_ctrl.dart';

abstract class RefreshListViewStateCtrl<T> extends ListViewStateCtrl<T> {
  // 分页第一页的页码
  final int pageNumFirst = 1;

  // 分页数量
  final int pageSize = 10;

  // 当前页
  late int currPage;

  void loadingData() async {
    try {
      setLoading();
      List<T> fetchData = await loadData(page: ++currPage, pageSize: pageSize);
      if (isEmptyData(fetchData)) {
        currPage--;
        refreshController.loadNoData();
      } else {
        dataList.addAll(fetchData);
        onRefreshLoadCompleted(dataList);
        refreshController.loadComplete();
      }
      if (currPage == pageNumFirst) {
        setEmpty();
      } else {
        setLoading(loading: false);
      }
      List<String>? refreshBuilderIds = builderIds();
      zeroDelay(() {
        if (refreshBuilderIds != null) {
          updateListeners(refreshBuilderIds);
        } else {
          updateListener();
        }
      });
    } catch (e, s) {
      currPage--;
      refreshController.loadFailed();
      ExceptionHandler.getInstance()!.handleException(this, e, s);
    }
  }

  @override
  void onStateCtrlInit() {
    currPage = pageNumFirst;
    super.onStateCtrlInit();
  }
}
