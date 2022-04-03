import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateful_view.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-list/home-tood-list/home_todo_list_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-list/home-tood-list/home_todo_list_widget.dart';

class TodosHomePage extends BaseStatefulView with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    putDependency<HomeTodoListCtrl>(HomeTodoListCtrl());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: commonAppBar(
        title: 'ToDOs',
        leadingButtonIcon: Icons.widgets,
      ),
      body: autoBottomBarPaddingFrame(
        child: Container(
          width: screenWidth,
          child: HomeTodoListWidget(isActive: true,),
        ),
      ),
    );
  }
}
