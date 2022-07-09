import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/widget-chain/widget_chain.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/additional/refresh_item_builder.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/widgets/stateless_ctrl_widget.dart';
import 'package:i_chaos/base-getX-framework/mixin/nav_bar_mixin.dart';
import 'package:i_chaos/base-getX-framework/utils/image_helper.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/loading-widget/dot_loading.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_layout.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/resources/todos_res.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/floating-button/home-floating-button/home_todo_floating_btn_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/home-tab-view/home_todo_tab_view_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-list/home-todo-list/home_todos_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-list/home-todo-list/home_todos_widget.dart';

class HomeTodoTabViewWidget extends StatelessCtrlWidget<HomeTodoTabViewCtrl> {
  HomeTodoTabViewWidget({Key? key}) : super(key: key);

  static String activeTabNumBuilderId = 'active_tab_num';

  final BadgeTab completedTab =
      BadgeTab(text: S.current.todos_tabbar_widget_label_filtered_completed);

  @override
  Widget ctrlWidgetBuilder() {
    return DefaultTabController(
      length: metaCtrl.totalTabCnt,
      initialIndex: 0,
      animationDuration: const Duration(seconds: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _wrapTabBars(),
          _wrapTodoTabBarViews(),
        ],
      ),
    );
  }

  Widget _wrapTabBars() {
    return GetBuilder<HomeTodoTabViewCtrl>(
      builder: (_) {
        BadgeTab activeTab = BadgeTab(
          text: S.current.todos_tabbar_widget_label_filtered_active,
          badgeNum: metaCtrl.activeTodoCnt,
          isAutoDismiss: false,
        );

        List<BadgeTab> badgeTabs = [activeTab, completedTab];
        FlexColorThemeCtrl themeCtrl = findReference();
        return BrnTabBar(
          tabs: badgeTabs,
          indicatorColor: themeCtrl.getPrimaryColor(),
          indicatorPadding: AppLayout.padding.v10,
          indicatorWeight: 3,
          indicatorWidth: 30,
          labelColor: themeCtrl.getFitModeColor(usingPrimary: true),
          unselectedLabelColor: AppStyle.colors.lightGray,
          backgroundcolor: themeCtrl.getFitModeColor(isBackground: true),
        );
      },
      id: activeTabNumBuilderId,
    );
  }

  // 将ToDOs的已完成和未完成列表包装为tab内容视图
  Widget _wrapTodoTabBarViews() {
    return GetBuilder<HomeTodosCtrl>(builder: (_) {
      return TabBarView(
        children: metaCtrl.isLoadingState ? _loadings() : _todos(),
      ).intoContainer(
        width: screenWidth,
        // 减去appBar+日历条+过滤栏(含margin)+bottomBar(含margin)
        height: screenHeight - (NavBarMixin.commonAppBarHeight + 68 + 10 + 130),
      );
    });
  }

  List<Widget> _loadings() {
    final Widget loadingWidget = ImageHelper.imgWidget.vPromptImgWidget(
      image: TodosRes.images.loading,
      textWidget: DotLoadingWidget(
        text: S.current.todos_tabbar_widget_tip_filtered_loading,
      ),
    );

    List<Widget> dynamicLoadingImgs = [];
    for (int i = 0; i < metaCtrl.totalTabCnt; i++) {
      dynamicLoadingImgs.add(loadingWidget);
    }
    return dynamicLoadingImgs;
  }

  List<Widget> _todos() => [
        HomeTodosWidget(
          isActiveTodos: true,
          todosScrollListener: scrollNotifier(metaCtrl.activeTodoCnt),
        ),
        HomeTodosWidget(
            isActiveTodos: false,
            todosScrollListener: scrollNotifier(metaCtrl.completedTodoCnt)),
      ];

  ListScrollListener scrollNotifier(int todosCnt) {
    HomeTodoFloatingBtnCtrl floatingBtnCtrl = findReference();

    return ListScrollListener(onListScrollUpdate: () {
      if (todosCnt > 0) {
        floatingBtnCtrl.notify(FloatBtnStatus.hide);
      }
    }, onListScrollEnd: () {
      if (todosCnt > 0) {
        floatingBtnCtrl.notify(FloatBtnStatus.show);
      }
    }, onListOverScroll: () {
      if (todosCnt > 0 && floatingBtnCtrl.hide) {
        floatingBtnCtrl.notify(FloatBtnStatus.show);
      }
    });
  }
}
