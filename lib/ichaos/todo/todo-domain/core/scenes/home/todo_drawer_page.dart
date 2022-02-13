// ignore_for_file: prefer_initializing_formals, unused_local_variable, must_be_immutable, no_logic_in_create_state

import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/widgets/abstract_transparent_page_x.dart';
import 'package:i_chaos/ichaos/public/widgets/custom-pop-up-menu/custom_pop_up_menu.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_group_tip.dart';
import 'package:i_chaos/ichaos/public/widgets/ww-dialog/ww_dialog.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/tag_menu_item.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/tag_vo.dart';
import '../tag/tag-operation/tag_detail_page.dart';
import '../tag/tag-operation/tag_sorting_list_page.dart';
import '../tag/tag-operation/todo_tag_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/todolist/single_todo_list_vm.dart';
import 'package:i_chaos/icons/ali_icons.dart';
import 'package:i_chaos/main.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';

class PageTodoDrawer extends AbstractTransparentPageX {
  late double maxWidth;
  late double maxHeight;
  final TextStyle optionTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black, fontFamily: 'Lexend Deca');

  late final TodoTagVM _tagVM;
  late final SingleTodoListVM _singleTodoListVM;

  late _WidgetTodoDrawer _drawer;

  // 标签按钮菜单数据模型
  late List<TagMenuItem> _menuItems;
  final List<CustomPopupMenuController> _popMenuController = [];
  CustomPopupMenuController sortingMenuItemController = CustomPopupMenuController();

  PageTodoDrawer(this._tagVM, this._singleTodoListVM) {
    maxWidth = screen.screenWidth / 3 * 2;
    maxHeight = screen.screenHeight;
  }

  @override
  void childWidgetInitState() {
    _initTagMenuItem(context);
  }

  // 初始化标签操作菜单
  void _initTagMenuItem(BuildContext context) {
    _menuItems = [
      TagMenuItem(S.of(context).tag_drawer_menu_item_edit, Icons.edit, Colors.blue, TagMenuFlag.edit, onTap: (args) async {
        AbstractTransparentPageX thisPage = args[0] as AbstractTransparentPageX;
        TagVO tag = args[1] as TagVO;

        await thisPage.push(PageTagDetail(_tagVM, tag));
        await _tagVM.refresh();
        _updateDrawerTagItems();
      }),
      TagMenuItem(S.of(context).tag_drawer_menu_item_delete, Icons.delete, Colors.red, TagMenuFlag.delete, onTap: (args) {
        AbstractTransparentPageX thisPage = args[0] as AbstractTransparentPageX;
        TagVO tag = args[1] as TagVO;

        WWDialog.showBottomDialog(context,
            title: S.of(context).tag_drawer_menu_item_delete_tip_title,
            titleAlign: TextAlign.center,
            titleColor: Colors.red,
            content: S.of(context).tag_drawer_menu_item_delete_tip_content(tag.name, tag.createTime.yyyyMMddHHmmss),
            contentAlign: TextAlign.start,
            contentColor: Colors.black,
            contentFontSize: 15.0,
            location: DiaLogLocation.middle,
            arrangeType: buttonArrangeType.row,
            customWidgetButtons: [
              defaultCustomButton(context, text: S.of(context).tag_drawer_menu_item_delete_tip_btn_confirm, textFontSize: 15.0, buttonHeight: 35.0,
                  onTap: () {
                Future.delayed(const Duration(milliseconds: 100)).whenComplete(() async {
                  await _singleTodoListVM.clearTodoTag(tag.id!);
                  await _tagVM.deleteTag(tag.id!);
                  await _tagVM.refresh();
                  _updateDrawerTagItems();
                });
              }),
              defaultCustomButton(context,
                  text: S.of(context).tag_drawer_menu_item_delete_tip_btn_cancel,
                  textFontSize: 15.0,
                  buttonHeight: 35.0,
                  textColor: Colors.grey,
                  onTap: () {}),
            ]);
      }),
      TagMenuItem(S.of(context).tag_drawer_menu_item_sort, Icons.sort, Colors.blue, TagMenuFlag.sort, onTap: (args) async {
        AbstractTransparentPageX thisPage = args[0] as AbstractTransparentPageX;

        await thisPage.push(PageTagSorting(_tagVM));
        await _tagVM.refresh();
        _updateDrawerTagItems();
      }),
    ];
  }

  void _updateDrawerTagItems() {
    _drawer.drawerTodoTagOptionBarItems = _drawerTagItems();
    _drawer.state.setState(() {});
  }

  // 抽屉基础选项
  List<OptionBarItem> _drawerBaseOption() {
    return [
      OptionBarItem(S.of(context).tag_drawer_item_daily_todo,
          textStyle: optionTextStyle, icon: Icons.assignment, rightIcon: AliIcons.IconEnter, onTap: () {
        directClose();
        mainScene.switchMainSceneTap(3);
      }),
      OptionBarItem(S.of(context).tag_drawer_item_recently_todo,
          icon: Icons.assessment_rounded, textStyle: optionTextStyle, rightIcon: AliIcons.IconEnter, targetPageBuilder: () async {}),
    ];
  }

  // 抽屉标签选项
  List<OptionBarItem> _drawerTagItems() {
    List<TagVO> tagList = _tagVM.tagList;
    List<OptionBarItem> tagItems = [];

    // 无分类标签
    tagItems.add(
      OptionBarItem(
        S.of(context).tag_drawer_item_no_tag_todo,
        textStyle: optionTextStyle,
        icon: Icons.move_to_inbox,
        iconSize: 15,
        iconColor: Colors.grey,
        onTap: () {},
      ),
    );

    for (int i = 0; i < tagList.length; i++) {
      TagVO tag = tagList[i];
      CustomPopupMenuController currentTagMenuController = CustomPopupMenuController();
      _popMenuController.add(currentTagMenuController);

      tagItems.add(
        OptionBarItem(tag.name,
            textStyle: optionTextStyle,
            icon: Icons.circle,
            iconSize: 15,
            iconColor: tag.colorRGBA,
            extensionWidget: _widgetCustomPopMenu(
                childIcon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                  size: 12,
                ),
                tag: tag,
                controller: currentTagMenuController,
                items: [_menuItems[0], _menuItems[1]]),
            position: OptionExtensionContentPosition.right,
            onTap: () {}),
      );
    }

    tagItems.add(
      OptionBarItem(
        S.of(context).tag_drawer_item_new_tag,
        textStyle: optionTextStyle,
        icon: Icons.add_circle_outline,
        iconSize: 15,
        iconColor: Colors.grey,
        onTap: () {
          directClose().whenComplete(() async {
            await push(PageTagDetail(_tagVM, null));
            _tagVM.refresh();
          });
        },
      ),
    );
    return tagItems;
  }

  @override
  Widget buildWidget() {
    // 抽屉基础选项
    List<OptionBarItem> drawerBaseOptionBarItems = _drawerBaseOption();

    // 抽屉标签选项
    List<OptionBarItem> drawerTodoTagOptionBarItems = _drawerTagItems();

    Map<int, OptionGroupTipTool> optionGroupTip = {
      0: OptionGroupTipTool(tip: S.of(context).tag_drawer_item_tip_basic),
      1: OptionGroupTipTool(
          tip: S.of(context).tag_drawer_item_tip_tag,
          tool: _widgetCustomPopMenu(
              childIcon: const Icon(
                Icons.settings,
                color: Colors.grey,
                size: 14,
              ),
              iconBox: 18,
              controller: sortingMenuItemController,
              items: [_menuItems[2]]),
          toolPosition: OptionGroupTipPosition.right)
    };

    _drawer = _WidgetTodoDrawer(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        screen: screen,
        drawerBaseOptionBarItems: drawerBaseOptionBarItems,
        drawerTodoTagOptionBarItems: drawerTodoTagOptionBarItems,
        optionGroupTip: optionGroupTip);
    return _drawer;
  }

  // 自定义弹出菜单
  Widget _widgetCustomPopMenu(
      {required Icon childIcon, double? iconBox = 38, required CustomPopupMenuController controller, TagVO? tag, required List<TagMenuItem> items}) {
    int menuItemCnt = items.length;

    int maxTextLength = 0;
    for (var item in items) {
      int bytesLen = utf8.encode(item.title).length;
      if (bytesLen > maxTextLength) {
        maxTextLength = bytesLen;
      }
    }

    final menuBuilder = Container(
      width: 25 + maxTextLength * 10,
      height: menuItemCnt * 35 + menuItemCnt - 1,
      color: const Color(0xFF4C4C4C),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _widgetMenuSingleItem(items[index], controller, tag),
              if (index != menuItemCnt - 1)
                const Divider(
                  height: 1,
                  color: Colors.white,
                )
            ],
          );
        },
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menuItemCnt,
      ),
    );

    return CustomPopupMenu(
      key: UniqueKey(),
      controller: controller,
      child: SizedBox(
        height: iconBox,
        width: iconBox,
        child: childIcon,
      ),
      menuBuilder: () {
        return ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: menuBuilder,
        );
      },
      barrierColor: Colors.transparent,
      pressType: PressType.singleClick,
      verticalMargin: 0,
    );
  }

  Widget _widgetMenuSingleItem(TagMenuItem item, CustomPopupMenuController controller, TagVO? tag) {
    final Widget iconTextRow = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            item.icon,
            size: 20,
            color: item.color,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              item.title,
              style: TextStyle(color: item.color, fontSize: 14),
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        child: SizedBox(
          height: 25,
          child: iconTextRow,
        ),
        onTap: () {
          controller.hideMenu();
          if (tag != null) {
            item.onTap?.call([this, tag]);
          } else {
            item.onTap?.call([this]);
          }
        },
      ),
    );
  }

  @override
  AtpXPageConfig initPageConfig() {
    return AtpXPageConfig(childWidgetMaxWidth: maxWidth, animationDuration: 250);
  }

  @override
  void pageDispose() {
    _disposeMenuController();
  }

  // 标签菜单选项controller销毁
  void _disposeMenuController() {
    if (_popMenuController.isNotEmpty) {
      for (var c in _popMenuController) {
        c.dispose();
      }
    }
    sortingMenuItemController.dispose();
  }
}

class _WidgetTodoDrawer extends StatefulWidget {
  _WidgetTodoDrawer({
    Key? key,
    required this.maxWidth,
    required this.maxHeight,
    required this.screen,
    required List<OptionBarItem> drawerBaseOptionBarItems,
    required List<OptionBarItem> drawerTodoTagOptionBarItems,
    required Map<int, OptionGroupTipTool> optionGroupTip,
  }) : super(key: key) {
    this.drawerBaseOptionBarItems = drawerBaseOptionBarItems;
    this.drawerTodoTagOptionBarItems = drawerTodoTagOptionBarItems;
    this.optionGroupTip = optionGroupTip;
  }

  final double maxWidth;
  final double maxHeight;
  final ScreenUtil screen;
  late List<OptionBarItem> drawerBaseOptionBarItems;
  late List<OptionBarItem> drawerTodoTagOptionBarItems;
  late Map<int, OptionGroupTipTool> optionGroupTip;

  final _WidgetTodoDrawerState state = _WidgetTodoDrawerState();

  @override
  _WidgetTodoDrawerState createState() => state;
}

class _WidgetTodoDrawerState extends State<_WidgetTodoDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      width: widget.maxWidth,
      height: widget.maxHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(width: widget.maxWidth, height: widget.screen.statusBarHeight, color: Colors.teal),
          SizedBox(
            width: widget.maxWidth,
            height: widget.maxHeight - widget.screen.statusBarHeight,
            child: OptionBarList(
                optionBarItemGroups: [widget.drawerBaseOptionBarItems, widget.drawerTodoTagOptionBarItems],
                optionGroupTips: widget.optionGroupTip,
                optionItemHeight: 38),
          ),
        ],
      ),
    );
  }
}
