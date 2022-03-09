import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:i_chaos/base_framework/utils/image_helper.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/widgets/ww-dialog/ww_dialog.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/details/single_todo_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/draft-box/draft_list_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/month_calendar_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/todolist/single_todo_list_vm.dart';
import 'package:i_chaos/icons/ali_icons.dart';
import 'package:widget_chain/widget_chain.dart';

// 草稿事件列表
class PageDraftList extends PageState {
  late final DraftListVM _draftListVM;
  late final SingleTodoListVM _singleTodoListVM;

  PageDraftList(this._draftListVM, this._singleTodoListVM);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget draftTitle = const Icon(AliIcons.IconTasklistFill, size: 20)
        .intoPadding(padding: const EdgeInsets.only(right: 5))
        .addNeighbor(Text(S.of(context).todo_draft_page_appbar_title, style: const TextStyle(fontSize: 18)))
        .intoRow();

    return Scaffold(
      appBar: customCommonAppBar(customTitle: draftTitle, needPop: true, backgroundColor: Colors.teal, actions: <Widget>[
        if (_draftListVM.draftListCnt > 0)
          IconButton(
              onPressed: () {
                // 展示一键删除草稿按钮
                WWDialog.showTopDialog(context,
                    dialogWidth: ScreenUtil.getInstance().screenWidth / 2,
                    triangleType: DiaLogTriangleType.right,
                    bgColor: Colors.white,
                    contentColor: Colors.black,
                    contentFontSize: 14,
                    customListDatasource: [
                      defaultCustomButton(context,
                          text: S.of(context).todo_draft_appbar_option_delete_all, textColor: Colors.red, fontWeight: FontWeight.w600, onTap: () {
                        WWDialog.showBottomDialog(context,
                            title: S.of(context).todo_draft_appbar_option_delete_all_tip_title,
                            titleAlign: TextAlign.center,
                            titleColor: Colors.red,
                            content: S.of(context).todo_draft_appbar_option_delete_all_tip_content,
                            contentAlign: TextAlign.start,
                            contentColor: Colors.black,
                            contentFontSize: 15.0,
                            location: DiaLogLocation.middle,
                            arrangeType: buttonArrangeType.row,
                            customWidgetButtons: [
                              defaultCustomButton(context,
                                  text: S.of(context).todo_draft_appbar_option_delete_all_tip_btn_confirm,
                                  textFontSize: 15.0,
                                  buttonHeight: 35.0, onTap: () async {
                                _draftListVM.deleteDraftByIds(_draftListVM.draftList.map((e) => e.id!).toList());
                                await _draftListVM.refresh();
                                setState(() {});
                              }),
                              defaultCustomButton(context,
                                  text: S.of(context).todo_draft_appbar_option_delete_all_tip_btn_cancel,
                                  textFontSize: 15.0,
                                  buttonHeight: 35.0,
                                  textColor: Colors.grey,
                                  onTap: () {}),
                            ]);
                      })
                    ]);
              },
              icon: const Icon(AliIcons.IconMore)),
        const SizedBox(
          width: 14,
        )
      ]),
      body: Container(
        color: _draftListVM.draftListCnt > 0 ? Colors.grey[300] : Colors.white,
        width: ScreenUtil.getInstance().screenWidth,
        height: ScreenUtil.getInstance().screenHeight - 45,
        child: _draftListVM.draftListCnt > 0 ? _widgetDraftList() : _widgetEmptyImage(),
      ),
    );
  }

  Widget _widgetEmptyImage() {
    return ImageHelper.placeHolderLocalSVGImg(imageName: 'image_search_empty', width: 100, height: 100)
        .addNeighbor(Text(S.of(context).todo_draft_list_not_found_tip_text,
            style: const TextStyle(
              color: Color(0xFF757575),
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.w500,
              fontSize: 12,
            )))
        .intoColumn(mainAxisAlignment: MainAxisAlignment.start)
        .intoPadding(padding: const EdgeInsets.symmetric(vertical: 40));

//    return Padding(
//      padding: const EdgeInsets.symmetric(vertical: 40),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: [
//          ImageHelper.placeHolderLocalSVGImg(imageName: 'image_search_empty', width: 100, height: 100),
//          Text(S.of(context).todo_draft_list_not_found_tip_text,
//              style: const TextStyle(color: Color(0xFF757575), fontFamily: 'Lexend Deca', fontWeight: FontWeight.w500, fontSize: 12))
//        ],
//      ),
//    );
  }

  Widget _widgetDraftList() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        String currentKey = _draftListVM.draftTodoMapOrderKeys[index];
        List<TodoVO> vos = _draftListVM.draftTodoMap[currentKey]!;

        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 3),
                child: Text(
                  currentKey,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.black54),
                ),
              ),
              for (int i = 0; i < vos.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Slidable(
                    key: ValueKey(vos[i].id!),
                    child: _widgetSingleDraft(vos[i]),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (ctx) {
                            push(SingleTodoPage(vos[i], onSave: () async {
                              await _draftListVM.refresh();
                              setState(() {});
                            }));
                          },
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          icon: AliIcons.IconBrush,
                          label: S.of(context).todo_draft_list_item_option_modify,
                        ),
                        SlidableAction(
                          onPressed: (ctx) {
                            WWDialog.showBottomDialog(context,
                                title: S.of(context).todo_draft_list_item_option_delete_tip_title,
                                titleAlign: TextAlign.center,
                                titleColor: Colors.red,
                                content: '${S.of(context).todo_draft_list_item_option_delete_tip_content} ${vos[i].content}',
                                contentAlign: TextAlign.start,
                                contentColor: Colors.black,
                                contentFontSize: 15.0,
                                location: DiaLogLocation.middle,
                                arrangeType: buttonArrangeType.row,
                                customWidgetButtons: [
                                  defaultCustomButton(context,
                                      text: S.of(context).todo_draft_list_item_option_delete_tip_btn_confirm,
                                      textFontSize: 15.0,
                                      buttonHeight: 35.0, onTap: () async {
                                    _draftListVM.deleteDraft(vos[i].id!);
                                    await _draftListVM.refresh();
                                    Future.delayed(const Duration(milliseconds: 100)).whenComplete(() {
                                      setState(() {});
                                    });
                                  }),
                                  defaultCustomButton(context,
                                      text: S.of(context).todo_draft_list_item_option_delete_tip_btn_cancel,
                                      textFontSize: 15.0,
                                      buttonHeight: 35.0,
                                      textColor: Colors.grey,
                                      onTap: () {}),
                                ]);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: AliIcons.IconDelete,
                          label: S.of(context).todo_draft_list_item_option_delete,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
      itemCount: _draftListVM.draftTodoMapOrderKeys.length,
    );
  }

  Widget _widgetSingleDraft(TodoVO vo) {
    List<Widget> inkTextList = [
      _inkText(S.of(context).todo_draft_list_item_option_move_to_today, onTap: () async {
        vo.validTime = DateTime.now();
        _singleTodoListVM.updateTodo(vo);
        await _draftListVM.refresh();
        setState(() {});
      }),
      _inkText(S.of(context).todo_draft_list_item_option_move_to_tomorrow, onTap: () async {
        vo.validTime = DateTime.now().add(const Duration(days: 1));
        _singleTodoListVM.updateTodo(vo);
        await _draftListVM.refresh();
        setState(() {});
      }),
      _inkText(S.of(context).todo_draft_list_item_option_select_date, needDivide: false, onTap: () async {
        DateTime? selectDate = await push(PageMonthCalendar());
        if (selectDate != null) {
          vo.validTime = selectDate;
          _singleTodoListVM.updateTodo(vo);
          await _draftListVM.refresh();
          setState(() {});
        }
      }),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      width: ScreenUtil.getInstance().screenWidth,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            vo.content,
            style: const TextStyle(fontSize: 15),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (vo.isRemarkInfo)
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                '${vo.remark}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: inkTextList,
            ),
          )
        ],
      ),
    );
  }

  // 文字按钮
  Widget _inkText(String text, {VoidCallback? onTap, Color textColor = Colors.teal, bool needDivide = true}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: onTap,
              child: Text(
                text,
                style: TextStyle(fontSize: 13, color: textColor),
              ),
            ),
          ),
          if (needDivide)
            const Text(
              '|',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}
