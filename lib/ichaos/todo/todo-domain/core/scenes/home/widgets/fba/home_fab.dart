import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/calendar/calendar_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:provider/provider.dart';

import 'home_fab_vm.dart';

class TodoHomeFloatingActionBtn extends WidgetState with SingleTickerProviderStateMixin {
  late AnimationController _btnAnimationController;
  late Animation<Offset> _offsetAnimation;
  late TodoHomeFloatingActionBtnVM _actionBtnVM;

  TodoHomeFloatingActionBtn({required TodoHomeFloatingActionBtnVM actionBtnVM}) {
      _actionBtnVM = actionBtnVM;
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

    return SlideTransition(
        child: ProviderWidget2(
            model1: filteredTabBarVM,
            model2: Provider.of<CalendarBarVM>(context),
            builder: (ctx, fTabVM, cBarVM, _) {
              _actionBtnVM = TodoHomeFloatingActionBtnVM(filteredTabBarVM: filteredTabBarVM, calendarBarVM: calendarBarVM);

              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  if (!_actionBtnVM.isToday())
                    FloatingActionButton(
                      backgroundColor: Colors.grey[50],
                      child: const Text(
                        '今',
                        style: TextStyle(fontSize: 18, color: Colors.teal),
                      ),
                      heroTag: 'today', // 避免多个FloatingActionButton重复使用默认tag的异常
                      onPressed: () {
                        _actionBtnVM.backToToday();
                      },
                    ),
                  if (_actionBtnVM.isToday()) 0.hGap,
                  20.hGap,
                  FloatingActionButton(
                    child: const Icon(Icons.add),
                    heroTag: 'add',
                    onPressed: () {
//              Navigator.push(context, MaterialPageRoute(builder: (context) {
//                return TodoEditScene(null);
//              }));
                    },
                  ),
                ],
              );
            }),
        position: _offsetAnimation);
  }
}
