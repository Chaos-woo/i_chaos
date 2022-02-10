import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/widgets/abstract_transparent_page.dart';
import 'package:i_chaos/ichaos/public/widgets/custom-pop-up-menu/custom_pop_up_menu.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_group_tip.dart';
import 'package:i_chaos/ichaos/public/widgets/ww-dialog/ww_dialog.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/tag_menu_item.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/tag_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/tag/tag_detail_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/tag/tag_sorting_list_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/tag/todo_tag_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/todolist/single_todo_list_vm.dart';
import 'package:i_chaos/icons/ali_icons.dart';
import 'package:i_chaos/main.dart';

class PageTodoDrawer extends AbstractTransparentPageX {
  final ScreenUtil _scUtil = ScreenUtil.getInstance();
  late double maxWidth;
  late double maxHeight;

  late final TodoTagVM _tagVM;
  late final SingleTodoListVM _singleTodoListVM;

  // 标签按钮菜单数据模型
  late List<TagMenuItem> menuItems;

  final List<CustomPopupMenuController> _popMenuController = [];

  PageTodoDrawer(this._tagVM, this._singleTodoListVM) {
    maxWidth = _scUtil.screenWidth / 3 * 2;
    maxHeight = _scUtil.screenHeight;

    menuItems = [
      TagMenuItem('编辑', Icons.edit, Colors.blue, TagMenuFlag.edit, onTap: (args) async {
        AbstractTransparentPageX thisPage = args[0] as AbstractTransparentPageX;
        TagVO tag = args[1] as TagVO;

        await thisPage.push(PageTagDetail(_tagVM, tag));
        await _tagVM.refresh();
        thisPage.setState(() {});
      }),
      TagMenuItem('删除', Icons.delete, Colors.red, TagMenuFlag.delete, onTap: (args) {
        AbstractTransparentPageX thisPage = args[0] as AbstractTransparentPageX;
        TagVO tag = args[1] as TagVO;

        WWDialog.showBottomDialog(context,
            title: S.of(context).todo_card_option_btn_delete_tip_title,
            titleAlign: TextAlign.center,
            titleColor: Colors.red,
            content: 'tag information: createTime: ${tag.createTime} ${tag.name}',
            contentAlign: TextAlign.start,
            contentColor: Colors.black,
            contentFontSize: 15.0,
            location: DiaLogLocation.middle,
            arrangeType: buttonArrangeType.row,
            customWidgetButtons: [
              defaultCustomButton(context, text: S.of(context).todo_card_option_btn_delete_tip_confirm, textFontSize: 15.0, buttonHeight: 35.0, onTap: () {
                Future.delayed(const Duration(milliseconds: 100)).whenComplete(() async {
                  await _singleTodoListVM.clearTodoTag(tag.id!);
                  await _tagVM.deleteTag(tag.id!);
                  await _tagVM.refresh();
                  thisPage.setState(() {});
                });
              }),
              defaultCustomButton(context, text: S.of(context).todo_card_option_btn_delete_tip_cancel, textFontSize: 15.0, buttonHeight: 35.0, textColor: Colors.grey, onTap: () {}),
            ]);
      }),
      TagMenuItem('sort', Icons.edit, Colors.blue, TagMenuFlag.edit, onTap: (args) async {
        AbstractTransparentPageX thisPage = args[0] as AbstractTransparentPageX;

        await thisPage.push(PageTagSorting(_tagVM));
        await _tagVM.refresh();
        thisPage.setState(() {});
      }),
    ];
  }



  @override
  Widget buildWidget(BuildContext context) {
    const TextStyle optionTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black, fontFamily: 'Lexend Deca');

    // 抽屉基础选项
    List<OptionBarItem> drawerBaseOptionBarItems = [
      OptionBarItem('日常 TODO', textStyle: optionTextStyle, icon: Icons.assignment, rightIcon: AliIcons.IconEnter, onTap: () {
        directClose();
        mainScene.switchMainSceneTap(3);
      }),
      OptionBarItem('最近 TODO', icon: Icons.assignment, textStyle: optionTextStyle, rightIcon: AliIcons.IconEnter, targetPageBuilder: () async {}),
    ];

    // 抽屉标签选项
    List<TagVO> tagList = _tagVM.tagList;
    List<OptionBarItem> tagItems = [];

    // 无分类标签
    tagItems.add(
      OptionBarItem(
        '未分类清单',
        textStyle: optionTextStyle,
        icon: Icons.move_to_inbox,
        iconSize: 15,
        iconColor: Colors.grey,
        onTap: () {},
      ),
    );

    for (int i=0;i<tagList.length;i++) {
      TagVO tag = tagList[i];
      CustomPopupMenuController currentTagMenuController = CustomPopupMenuController();

      tagItems.add(
        OptionBarItem(tag.name,
            textStyle: optionTextStyle,
            icon: Icons.circle,
            iconSize: 15,
            iconColor: tag.colorRGBA,
            extensionWidget: CustomPopupMenu(
              key: UniqueKey(),
              controller: currentTagMenuController,
              child: const SizedBox(
                height: 38,
                width: 38,
                child: Icon(
                  Icons.more_vert,
//                color: Colors.grey,
                  size: 14,
                ),
              ),
              menuBuilder: () {
                int usingMenuItemMaxCnt = 2;

                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: 70,
                    height: usingMenuItemMaxCnt * 35 + usingMenuItemMaxCnt - 1,
                    color: const Color(0xFF4C4C4C),
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        TagMenuItem item = menuItems[index];

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: InkWell(
                                child: SizedBox(
                                  height: 25,
                                  child: Center(
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
                                  ),
                                ),
                                onTap: () {
                                  currentTagMenuController.hideMenu();
                                  item.onTap?.call([this, tag]);
                                },
                              ),
                            ),
                            if (index != usingMenuItemMaxCnt - 1)
                              const Divider(
                                height: 1,
                                color: Colors.white,
                              )
                          ],
                        );
                      },
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: usingMenuItemMaxCnt,
                    ),
                  ),
                );
              },
              barrierColor: Colors.transparent,
              pressType: PressType.singleClick,
              verticalMargin: 0,
            ),
            position: OptionExtensionContentPosition.right,
            onTap: () {}),
      );
    }

    tagItems.add(
      OptionBarItem(
        '新建标签',
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

    List<OptionBarItem> drawerTodoTagOptionBarItems = tagItems;

    CustomPopupMenuController sortingMenuItemController = CustomPopupMenuController();
    Map<int, OptionGroupTipTool> optionGroupTip = {
      0: OptionGroupTipTool(tip: '基础清单'),
      1: OptionGroupTipTool(
          tip: '标签清单',
          tool: CustomPopupMenu(
            key: UniqueKey(),
            controller: sortingMenuItemController,
            child: const SizedBox(
              height: 38,
              width: 38,
              child: Icon(
                Icons.more_vert,
//                color: Colors.grey,
                size: 14,
              ),
            ),
            menuBuilder: () {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 70,
                  height: 1 * 35,
                  color: const Color(0xFF4C4C4C),
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      TagMenuItem item = menuItems[2]; // sort

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: InkWell(
                              child: SizedBox(
                                height: 25,
                                child: Center(
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
                                ),
                              ),
                              onTap: () {
                                sortingMenuItemController.hideMenu();
                                item.onTap?.call([this]);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    padding: const EdgeInsets.all(0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                  ),
                ),
              );
            },
            barrierColor: Colors.transparent,
            pressType: PressType.singleClick,
            verticalMargin: 0,
          ),
          toolPosition: OptionGroupTipPosition.right)
    };

    return Container(
      color: Colors.grey[200],
      width: maxWidth,
      height: maxHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(width: maxWidth, height: _scUtil.statusBarHeight, color: Colors.teal),
          SizedBox(
            width: maxWidth,
            height: maxHeight - _scUtil.statusBarHeight,
            child: OptionBarList(
                optionBarItemGroups: [drawerBaseOptionBarItems, drawerTodoTagOptionBarItems], optionGroupTips: optionGroupTip, optionItemHeight: 38),
          ),
        ],
      ),
    );
  }

  @override
  initPageParams() {
    widgetMaxWidth = maxWidth;
    animationDuration = 250; // ms
    leftStartDirection = true;
    leftPadding = 0;

    _tagVM.refresh();
  }

  @override
  prePageDispose() {
    _disposeMenuController();
  }

  void _disposeMenuController() {
    if (_popMenuController.isNotEmpty) {
      for(var c in _popMenuController) {
        c.dispose();
      }
    }
  }
}
