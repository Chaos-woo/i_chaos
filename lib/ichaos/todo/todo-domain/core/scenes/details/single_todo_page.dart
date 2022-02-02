// ignore_for_file: prefer_initializing_formals

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
import 'package:i_chaos/ichaos/public/units/snack_bar_util.dart';
import 'package:i_chaos/ichaos/public/widgets/button-group/radio_button_group.dart';
import 'package:i_chaos/ichaos/public/widgets/button-group/variable_button_label.dart';
import 'package:i_chaos/ichaos/public/widgets/ww-dialog/ww_dialog.dart';
import 'package:i_chaos/ichaos/public/widgets/ww-dialog/ww_top_dialog_item_data.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/details/single_todo_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/subtask-group/subtask_list.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/subtask-group/subtask_list_vm.dart';
import '../../widgets/month_calendar_page.dart';
import 'package:i_chaos/icons/ali_icons.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:provider/provider.dart';

typedef OnSaveCallback = void Function();

class SingleTodoPage extends PageState {
  final TodoVO _originalTodo;
  late SingleTodoVM _singleTodoVM;
  late OnSaveCallback? onSave;

  SingleTodoPage(this._originalTodo, {OnSaveCallback? onSave}) {
    this.onSave = onSave;
  }

  @override
  void initState() {
    super.initState();
    _singleTodoVM = SingleTodoVM(_originalTodo);
  }

  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(
        child: ProviderWidget<SingleTodoVM>(
            model: _singleTodoVM,
            builder: (ctx, vm, child) {
              return Scaffold(
                appBar: AppBar(
                  leading: InkWell(
                    child: const Icon(AliIcons.IconReturn),
                    onTap: () {
                      pop();
                    },
                  ),
                  title: Text(
                    _singleTodoVM.isNew ? S.of(context).todo_edit_appbar_title_add : S.of(context).todo_edit_appbar_title_edit,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  toolbarHeight: 40,
                  actions: <Widget>[
                    IconButton(
                        onPressed: () {
                          // 展示重置按钮
                          WWDialog.showTopDialog(context,
                              dialogWidth: 100,
                              triangleType: DiaLogTriangleType.right,
                              bgColor: Colors.white,
                              contentColor: Colors.black,
                              contentFontSize: 14,
                              listDatasource: [
                                TopDialogItemData(S.of(context).todo_edit_reset, '0'),
                              ], onTap: (TopDialogItemData item) {
                            _singleTodoVM.reset(_originalTodo);
                          });
                        },
                        icon: const Icon(AliIcons.IconMore)),
                    const SizedBox(
                      width: 14,
                    )
                  ],
                ),
                body: KeyboardAvoider(
                  autoScroll: true,
                  child: Selector<SingleTodoVM, SingleTodoVM>(
                    selector: (ctx, vm) => vm,
                    shouldRebuild: (pre, next) => true,
                    builder: (ctx, vm, _) {
                      return _buildForm(vm);
                    },
                  ),
                ),
              );
            }));
  }

  Widget _buildForm(SingleTodoVM _singleTodoVM) {
    // 整体padding
    const EdgeInsetsDirectional wholePadding = EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0);

    return Padding(
      padding: const EdgeInsetsDirectional.all(5),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    S.of(context).todo_edit_content_label,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                )
              ],
            ),
            Padding(
              padding: wholePadding,
              child: TextFormField(
                controller: _singleTodoVM.contentController,
                obscureText: false,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 3,
                maxLength: 50,
                decoration: InputDecoration(
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: wholePadding,
                ),
                style: _singleTodoVM.formFieldSimpleTextStyle(Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    S.of(context).todo_edit_desc_label,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                )
              ],
            ),
            Padding(
              padding: wholePadding,
              child: TextFormField(
                controller: _singleTodoVM.descController,
                obscureText: false,
                minLines: 1,
                maxLines: 5,
                maxLength: 100,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: wholePadding,
                ),
                style: _singleTodoVM.formFieldSimpleTextStyle(Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    S.of(context).todo_edit_subtask_label,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                Padding(
                  padding: wholePadding,
                  child: InkWell(
                    child: const Icon(
                      AliIcons.IconPromptFill,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onTap: () {
                      WWDialog.showMiddleDialog(context,
                          title: S.of(context).todo_edit_subtask_tip_title,
                          content: S.of(context).todo_edit_subtask_tip_content,
                          contentAlign: TextAlign.left,
                          isNeedCloseDiaLog: true,
                          buttons: [S.of(context).todo_edit_subtask_tip_btn_confirm],
                          onTap: (index, ctx) {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: wholePadding,
              child: SizedBox(
                width: ScreenUtil.getInstance().screenWidth - 2 * wholePadding.start,
                child: ProviderWidget<SubTaskListVM>(
                    model: _singleTodoVM.subTaskListVM,
                    onModelReady: (vm) => vm.init(),
                    builder: (ctx, vm, child) {
                      return WidgetSubTaskList(vm).transformToPageWidget();
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    S.of(context).todo_edit_valid_date_label,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                Padding(
                  padding: wholePadding,
                  child: InkWell(
                    child: const Icon(
                      AliIcons.IconPromptFill,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onTap: () {
                      WWDialog.showMiddleDialog(context,
                          title: S.of(context).todo_edit_valid_date_tip_title,
                          content: S.of(context).todo_edit_valid_date_tip_content,
                          contentAlign: TextAlign.left,
                          isNeedCloseDiaLog: true,
                          buttons: [S.of(context).todo_edit_valid_date_tip_btn_confirm],
                          onTap: (index, ctx) {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: wholePadding,
              child: RadioButtonGroup(
                key: _singleTodoVM.todoDateBtnGroupKey,
                buttonGroupLabels: [
                  S.of(context).todo_edit_valid_date_btn_today,
                  S.of(context).todo_edit_valid_date_btn_tomorrow,
                  S.of(context).todo_edit_valid_date_btn_select_date,
                  S.of(context).todo_edit_valid_date_btn_draft,
                ],
                buttonGroupIcons: const [AliIcons.IconFlag, AliIcons.IconDocument, AliIcons.IconTime, AliIcons.IconTasklist],
                defaultSelectedIndex: _singleTodoVM.getSelectDateIndex(),
                onButtonChanged: (preIndex, index) async {
                  switch (index) {
                    case 0:
                      {
                        _singleTodoVM.todoForm.selectDate = DateTime.now();
                      }
                      break;
                    case 1:
                      {
                        _singleTodoVM.todoForm.selectDate = DayDateUtil.tomorrow();
                      }
                      break;
                    case 2:
                      {
                        DateTime? selectDate = await push(PageMonthCalendar(canBeCloseByTouchTransparentArea: false, canPopWhenSelectSameDateWithCurrent: true));
                        int selectDateBtnIndex = _singleTodoVM.getRightSelectDateBtnIndex(selectDate);
                        _singleTodoVM.todoForm.selectDate = selectDateBtnIndex == 0
                            ? DateTime.now()
                            : selectDateBtnIndex == 1
                            ? DayDateUtil.tomorrow()
                            : selectDateBtnIndex == 2
                            ? selectDate
                            : null;
                        index = selectDateBtnIndex;
                      }
                      break;
                    default:
                      {
                        _singleTodoVM.todoForm.selectDate = null;
                      }
                      break;
                  }
                  return index;
                },
                variableButtonLabels: [
                  VariableButtonLabel(2, (nextIndex, currStatus) {
                    if (nextIndex == 2) {
                      return _singleTodoVM.todoForm.selectedDate?.yyyyMMdd;
                    }
                    return null;
                  }),
                ],
                selectedButtonColor: Colors.teal,
                unSelectedButtonColor: const Color(0xFFD6D6D6),
                selectedLabelColor: Colors.white,
                unSelectedLabelColor: Colors.white,
                horizontal: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    S.of(context).todo_edit_level_label,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                )
              ],
            ),
            Padding(
              padding: wholePadding,
              child: RadioButtonGroup(
                key: _singleTodoVM.todoLevelBtnGroupKey,
                buttonGroupLabels: [
                  S.of(context).todo_edit_level_btn_deferrable,
                  S.of(context).todo_edit_level_btn_unimportant,
                  S.of(context).todo_edit_level_btn_normal,
                  S.of(context).todo_edit_level_btn_important,
                  S.of(context).todo_edit_level_btn_urgent
                ],
                buttonGroupIcons: const [AliIcons.IconDynamic, AliIcons.IconOrder, AliIcons.IconZhtn, AliIcons.IconShake, AliIcons.IconWarning],
                customSelectedButtonColor: _singleTodoVM.levelCustomBtnGroupColor,
                selectedButtonColor: Colors.teal,
                unSelectedButtonColor: const Color(0xFFD6D6D6),
                selectedLabelColor: Colors.white,
                unSelectedLabelColor: Colors.white,
                horizontal: true,
                defaultSelectedIndex: _singleTodoVM.isNew ? 2 : _singleTodoVM.todoForm.level,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    S.of(context).todo_edit_location_label,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                )
              ],
            ),
            Padding(
              padding: wholePadding,
              child: TextFormField(
                controller: _singleTodoVM.locationController,
                obscureText: false,
                minLines: 1,
                maxLines: 2,
                maxLength: 25,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: wholePadding,
                ),
                style: _singleTodoVM.formFieldSimpleTextStyle(Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40, 24, 40, 0),
              child: Selector<SingleTodoVM, bool>(
                selector: (ctx, vm) => vm.saveBtnAvailable,
                shouldRebuild: (pre, next) => pre != next,
                builder: (ctx, saveBtnAvailable, _) {
                  return saveBtnAvailable
                      ? GFButton(
                          text: S.of(context).todo_edit_btn_save,
                          textStyle: const TextStyle(fontFamily: 'Lexend Deca', fontSize: 15),
                          onPressed: () async {
                            bool saveSuccess = await _singleTodoVM.save();
                            if (!saveSuccess) {
                              SnackBarUtil.topBar(simpleContent: S.of(context).todo_edit_toast_save_failure);
                            } else {
                              SnackBarUtil.topBar(simpleContent: S.of(context).todo_edit_toast_save_success);
                              Future.delayed(const Duration(milliseconds: 5)).whenComplete(() {
                                onSave?.call();
                                pop();
                              });
                            }
                          },
                          icon: const Icon(
                            AliIcons.IconTask,
                            color: Colors.white,
                          ),
                          color: Colors.teal,
                          size: GFSize.LARGE,
                          fullWidthButton: true,
                        )
                      : GFButton(
                          text: S.of(context).todo_edit_btn_save,
                          textStyle: const TextStyle(fontFamily: 'Lexend Deca', fontSize: 15),
                          onPressed: null,
                          disabledColor: Color(0xFFD6D6D6),
                          disabledTextColor: Colors.white,
                          icon: const Icon(
                            AliIcons.IconTask,
                            color: Colors.white,
                          ),
                          size: GFSize.LARGE,
                          fullWidthButton: true,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
