import 'package:i_chaos/base-getX-framework/get-x/bindings/getx_bindings_guider.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/calendar-bar/calendar_bar_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/floating-button/home-floating-button/home_todo_floating_btn_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/floating-button/home-floating-button/home_todo_slide_btns.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/home-tab-view/home_todo_tab_view_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-list/home-todo-list/home_todos_ctrl.dart';

class TodosHomepageBindings extends GetXBindingsGuider {
  @override
  void putBindingReferences() {
    DateTime initDate = DateTime.now();
    // 周日历🗓控制器
    putReference<CalendarBarCtrl>(CalendarBarCtrl(initDate));
    // Todos列表控制器
    putReference<HomeTodosCtrl>(HomeTodosCtrl(initDate));
    // tabBar控制器
    putReference<HomeTodoTabViewCtrl>(HomeTodoTabViewCtrl());
    // 首页悬浮按钮滑动控制器
    putReference<HomeTodoSlideBtnsCtrl>(HomeTodoSlideBtnsCtrl());
    // 首页悬浮按钮控制器
    putReference<HomeTodoFloatingBtnCtrl>(HomeTodoFloatingBtnCtrl());
  }
}
