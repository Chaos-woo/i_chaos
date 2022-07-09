// ignore_for_file: avoid_renaming_method_parameters, implementation_imports

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateful_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/font-family/font_family_ctrl.dart';
import 'package:i_chaos/ichaos/setting-module/setting-pages/setting-homepage/setting_home_page.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-homepage/todos_homepage_page.dart';
import 'package:i_chaos/icons/ali_icons.dart';
import 'package:noripple_overscroll/noripple_overscroll.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// bottom bar下标状态
class ChaosHomeState {
  RxInt bottomBarIndex = 3.obs;
}

class ChaosHomeCtrl extends GetxController {
  ChaosHomeState state = ChaosHomeState();

  // 更新bottom bar下标，切换页面
  void changeBottomBarIndex(int index) {
    state.bottomBarIndex.value = index;
  }
}

class ChaosHomePage extends BaseStatefulView {
  ChaosHomePage();

  // bottomBar下标状态管理
  final ChaosHomeCtrl bottomBarState = Get.put(ChaosHomeCtrl());

  // 页面切换控制
  late PageController _pageController;

  // bottomBar页面实例
  late List<Widget> _tabPages;

  @override
  void initState() {
    super.initState();
    refreshAllPages();
    _pageController = PageController(initialPage: bottomBarState.state.bottomBarIndex.value);
  }

  void refreshAllPages() {
    _tabPages = [
      Temporature(S.current.setting_main_page_option_base_setting_theme_mode_sub_title),
      Temporature(S.current.setting_main_page_option_base_setting_theme_mode_sub_title),
      Temporature(S.current.setting_main_page_option_base_setting_theme_mode_sub_title),
      SizedBox(height: screenHeight - 90, child: TodosHomePage().selfGenerateStateView()),
      generateWidget(() => SettingHomePage()),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<SalomonBottomBarItem> _bottomBarItems = _getBottomBarItem();

    return Scaffold(
      bottomNavigationBar: Obx(() => SalomonBottomBar(
        currentIndex: bottomBarState.state.bottomBarIndex.value,
        items: _bottomBarItems,
        duration: const Duration(milliseconds: 800),
        onTap: (index) {
          bottomBarState.changeBottomBarIndex(index);

          /// 保持页面状态，避免页面跳转时重复加载
          _pageController.jumpToPage(index);
        },
      )),
      body: NoRippleOverScroll(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _tabPages,
        ),
      ),
    );
  }

  List<SalomonBottomBarItem> _getBottomBarItem() {
    FontFamilyCtrl fontSettingCtrl = findReference();

    return [
      /// Money
      SalomonBottomBarItem(
        icon: const Icon(AliIcons.IconCoupons),
        title: Text(
          S.current.app_tab_assert,
          style: TextStyle(fontFamily: fontSettingCtrl.fontFamily),
        ),
        selectedColor: Colors.orange,
      ),

      /// rss
      SalomonBottomBarItem(
        icon: const Icon(AliIcons.IconShake),
        title: Text(
          S.current.app_tab_feed,
          style: TextStyle(fontFamily: fontSettingCtrl.fontFamily),
        ),
        selectedColor: Colors.lightBlueAccent,
      ),

      /// blog of me
      SalomonBottomBarItem(
        icon: const Icon(AliIcons.IconWorkbench),
        title: Text(
          S.current.app_tab_log,
          style: TextStyle(fontFamily: fontSettingCtrl.fontFamily),
        ),
        selectedColor: Colors.red[700],
      ),

      /// Todo list
      SalomonBottomBarItem(
        icon: const Icon(AliIcons.IconActivity),
        title: Text(
          S.current.app_tab_todos,
          style: TextStyle(fontFamily: fontSettingCtrl.fontFamily),
        ),
        selectedColor: Colors.teal,
      ),

      /// Setting
      SalomonBottomBarItem(
        icon: const Icon(AliIcons.IconSetup),
        title: Text(
          S.current.app_tab_setting,
          style: TextStyle(fontFamily: fontSettingCtrl.fontFamily),
        ),
        selectedColor: Colors.indigo,
      ),
    ];
  }
}

class Temporature extends StatelessWidget {
  final String index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('${S.of(context).common_designing_label} $index'),
      ),
    );
  }

  const Temporature(this.index);
}
