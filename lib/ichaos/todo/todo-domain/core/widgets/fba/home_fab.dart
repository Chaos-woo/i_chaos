// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base_framework/factory/page/page_animation_builder.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/details/single_todo_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/calendar/calendar_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:provider/provider.dart';

import 'home_fab_vm.dart';

class TodoHomeFloatingActionBtn extends WidgetState with SingleTickerProviderStateMixin {
  late AnimationController _btnAnimationController;
  late Animation<Offset> _offsetAnimation;
  late TodoHomeFloatingActionBtnVM _actionBtnVM;
  late VoidCallback? _backToHomePageCallback;

  TodoHomeFloatingActionBtn({required TodoHomeFloatingActionBtnVM actionBtnVM, VoidCallback? backToHomePageCallback}) {
    _actionBtnVM = actionBtnVM;
    _backToHomePageCallback = backToHomePageCallback;
  }

  @override
  void initState() {
    super.initState();
    // 实例化动画
    _btnAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _offsetAnimation = Tween(begin: const Offset(0, 0), end: const Offset(1, 0)).animate(_btnAnimationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 组件生命周期添加和重新添加属性监听执行动作
    _actionBtnVM.addListenerOfBtnState((isDisplay) {
      if (isDisplay) {
        _btnAnimationController.reverse();
      } else {
        _btnAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    // 销毁动画控制器
    _btnAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTabBarVM = Provider.of<FilteredTabBarVM>(context, listen: false);
    final calendarBarVM = Provider.of<CalendarBarVM>(context);

    _actionBtnVM = TodoHomeFloatingActionBtnVM(filteredTabBarVM: filteredTabBarVM, calendarBarVM: calendarBarVM);

    List<Widget> floatingActionButtons = [];
    if (!_actionBtnVM.isToday()) {
      floatingActionButtons.add(
        FloatingActionButton(
          backgroundColor: Colors.grey[50],
          child: Text(
            S.of(context).todo_home_fba_btn_today,
            style: const TextStyle(fontSize: 18, color: Colors.teal),
          ),
          heroTag: 'today', // 避免多个FloatingActionButton重复使用默认tag的异常
          onPressed: () {
            _actionBtnVM.backToToday();
          },
        ),
      );
      floatingActionButtons.add(
        20.hGap,
      );
    }

    floatingActionButtons.add(
      FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
        heroTag: 'add',
        onPressed: () async {
          await push(
              SingleTodoPage(TodoVO.empty(), onSave: () {
                _backToHomePageCallback?.call();
              }),
              animation: PageAnimation.slide);
          _backToHomePageCallback?.call();
        },
      ),
    );

    return SlideTransition(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: floatingActionButtons,
      ),
      position: _offsetAnimation,
    );
  }
}
