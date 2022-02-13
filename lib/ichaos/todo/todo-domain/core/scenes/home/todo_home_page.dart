import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/factory/page/page_animation_builder.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/draft-box/draft_list_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/draft-box/draft_list_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/todo_drawer_page.dart';
import '../tag/tag-operation/todo_tag_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/calendar/calendar_bar.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/calendar/calendar_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/calendar_image.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/fba/home_fab.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/fba/home_fab_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/filtered/filtered_tab_bar.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/todolist/single_todo_list_vm.dart';
import 'package:i_chaos/icons/ali_icons.dart';
import 'package:provider/provider.dart';

// ToDO主页
class PageTodoHome extends PageState with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late SingleTodoListVM _singleTodoListVM;
  late DraftListVM _draftListVM;
  late TodoTagVM _todoTagVM;

  @override
  void initState() {
    super.initState();
    _singleTodoListVM = SingleTodoListVM();
    _draftListVM = DraftListVM();
    _todoTagVM = TodoTagVM();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return switchStatusBar2Dark(
        child: ProviderWidget<TodoTagVM>(
            model: _todoTagVM,
            onModelReady: (todoTagVM) {
              todoTagVM.refresh();
            },
            builder: (ctx, tagVM, _) {
              return ProviderWidget2<SingleTodoListVM, DraftListVM>(
                model1: _singleTodoListVM,
                model2: _draftListVM,
                onModelReady: (singleTodoListVM, draftListVM) {
                  singleTodoListVM.initData();
                  draftListVM.refresh();
                },
                builder: (ctx, singleTodoListVM, draftListVM, child) {
                  return ProviderWidget<FilteredTabBarVM>(
                      model: FilteredTabBarVM(singleTodoListVM: singleTodoListVM),
                      builder: (ctx, filteredTabBarVM, child) {
                        return ProviderWidget<CalendarBarVM>(
                          model: CalendarBarVM(filteredTabBarVM: filteredTabBarVM),
                          builder: (ctx, calendarBarVM, _) {
                            return ProviderWidget<TodoHomeFloatingActionBtnVM>(
                              model: TodoHomeFloatingActionBtnVM(filteredTabBarVM: filteredTabBarVM, calendarBarVM: calendarBarVM),
                              builder: (ctx, actionBtnVM, _) {
                                return _getMainScaffold(ctx);
                              },
                            );
                          },
                        );
                      });
                },
              );
            }));
  }

  // 获取主首页结构组件
  Widget _getMainScaffold(BuildContext ctx) {
    final filteredTabBarVM = Provider.of<FilteredTabBarVM>(ctx);
    final actionBtnVM = Provider.of<TodoHomeFloatingActionBtnVM>(ctx);
    final calendarBarVM = Provider.of<CalendarBarVM>(ctx);

    List<Widget> calendarBarWidgets = _widgetCalendarImage(calendarBarVM);
    calendarBarWidgets.add(WidgetCalendarBar().transformToPageWidget());

    return Scaffold(
      appBar: _widgetTodoAppBar(filteredTabBarVM),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(color: const Color(0xFFF5F5F5)),
          ),
          Positioned(
            child: Column(children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().screenWidth,
                child: Row(
                  children: calendarBarWidgets,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 2.0), //阴影y轴偏移量
                        blurRadius: 1, //阴影模糊程度
                        spreadRadius: 0 //阴影扩散程度
                        )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: ScreenUtil.getInstance().screenWidth,
                child: generateWidget(() => WidgetFilteredTabBar()),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: generateWidget(() => TodoHomeFloatingActionBtn(
          actionBtnVM: actionBtnVM,
          backToHomePageCallback: () {
            _draftListVM.refresh();
            filteredTabBarVM.selectedDateChange(filteredTabBarVM.currentDate);
          })),
    );
  }

  // 获取appBar
  PreferredSizeWidget _widgetTodoAppBar(FilteredTabBarVM filteredTabBarVM) {
    return AppBar(
      leading: InkWell(
        onTap: () async {
          await _todoTagVM.refresh();
          push(PageTodoDrawer(_todoTagVM, _singleTodoListVM));
        },
        child: const Icon(Icons.widgets),
      ),
      title: Row(
        children: const <Widget>[
          Text(
            'ToDOs',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.teal,
      titleSpacing: -5,
      toolbarHeight: 40,
      elevation: 0,
      actions: <Widget>[
        _widgetDraftIconBtn(filteredTabBarVM),
        IconButton(
          icon: const Icon(AliIcons.IconMore),
          onPressed: () {
            // handle the press
          },
        ),
      ],
    );
  }

  // 草稿箱按钮
  Widget _widgetDraftIconBtn(FilteredTabBarVM filteredTabBarVM) {
    List<Widget> draftAdditionalCountBadge = [
      Positioned(
        right: 2,
        top: 3,
        child: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.teal),
        ),
      ),
      Positioned(
          right: 4,
          top: 5,
          child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.white),
              child: Center(
                  child: Text(
                '${_draftListVM.draftListCnt > 100 ? '99+' : _draftListVM.draftListCnt}',
                style: const TextStyle(color: Colors.teal, fontSize: 8),
              )))),
    ];

    return Selector<DraftListVM, int>(
      builder: (ctx, cnt, _) {
        return Stack(
          children: [
            IconButton(
              icon: const Icon(AliIcons.IconTasklistFill),
              onPressed: () async {
                await _draftListVM.refresh();
                await push(PageDraftList(_draftListVM, _singleTodoListVM), animation: PageAnimation.Slide);
                await _draftListVM.refresh();
                filteredTabBarVM.selectedDateChange(filteredTabBarVM.currentDate);
              },
            ),
            if (_draftListVM.draftListCnt > 0)
              for (int i = 0; i < draftAdditionalCountBadge.length; i++) draftAdditionalCountBadge[i],
          ],
        );
      },
      selector: (ctx, vm) => vm.draftListCnt,
      shouldRebuild: (pre, next) => pre != next,
    );
  }

  // 获取年月图
  List<Widget> _widgetCalendarImage(CalendarBarVM calendarBarVM) {
    return <Widget>[
      CalendarImage(calendarBarVM).transformToPageWidget(),
      Container(
        width: 1,
        height: 68,
        color: Colors.teal,
        child: const VerticalDivider(
          width: 1,
          thickness: 68 * 0.85,
          indent: 10,
          endIndent: 10,
          color: Color(0xFFBDBDBD),
        ),
      ),
    ];
  }
}
