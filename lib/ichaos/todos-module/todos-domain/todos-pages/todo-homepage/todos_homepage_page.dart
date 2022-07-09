import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/navbar-module/navbar_actions.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/widget-chain/widget_chain.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/pages/stateful_view_page.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/calendar-bar/calendar_bar_widget.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/floating-button/home-floating-button/home_todo_floating_btn_widget.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/home-tab-view/home_todo_tab_view_widget.dart';
import 'package:i_chaos/icons/ali_icons.dart';

class TodosHomePage extends StatefulPage with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    super.withAutomaticKeepAliveClientMixin();
    return pageBuilder();
  }

  @override
  Widget pageBuilder() {
    NavBarActionHolder holder = NavBarActionHolder.holder();
    NavBarAction.icon(AliIcons.IconMore, isAnchor: false);

    return Scaffold(
      appBar: tapNavBar(
        title: 'ToDOs',
        leadingIcon: Icons.widgets,
        centerTitle: false,
        actions: holder.export,
      ),
      body: keepOutBottomPadding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CalendarBarWidget(),
            HomeTodoTabViewWidget().intoClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: HomeTodoFloatingBtnWidget(),
    );
  }
}
