// ignore_for_file: prefer_initializing_formals

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
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
import 'package:i_chaos/icons/ali_icons.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:provider/provider.dart';

import '../../widgets/month_calendar_page.dart';

typedef OnSaveCallback = void Function();

class SingleTodoPage extends PageState {
  final TodoVO _originalTodo;
  late SingleTodoVM _singleTodoVM;
  late OnSaveCallback? onSave;

  // 整体padding
  final EdgeInsetsDirectional _wholePadding = const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0);

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
    List<Widget> actionButtons = [
      IconButton(
          onPressed: () {
            // 展示重置按钮
            WWDialog.showTopDialog(context,
                dialogWidth: S.of(context).todo_edit_reset.codeUnits.length * 14,
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
    ];

    final formProvider = ProviderWidget<SingleTodoVM>(
        model: _singleTodoVM,
        builder: (ctx, vm, child) {
          return Scaffold(
            appBar: customCommonAppBar(
                title: _singleTodoVM.isNew ? S.of(context).todo_edit_appbar_title_add : S.of(context).todo_edit_appbar_title_edit,
                needPop: true,
                backgroundColor: Colors.teal,
                actions: actionButtons),
            body: Container(
              color: Colors.grey[100],
              child: KeyboardAvoider(
                autoScroll: true,
                child: Selector<SingleTodoVM, SingleTodoVM>(
                  selector: (ctx, vm) => vm,
                  shouldRebuild: (pre, next) => true,
                  builder: (ctx, vm, _) {
                    return _singleTodoFormBuilder(vm);
                  },
                ),
              ),
            ),
          );
        });

    return switchStatusBar2Dark(
      child: formProvider,
    );
  }

  Widget _singleTodoFormBuilder(SingleTodoVM singleTodoVM) {
    final List<Widget> form = _todoContentBuilder(singleTodoVM)
      ..addAll(_todoRemarkBuilder(singleTodoVM))
      ..addAll(_subTaskBuilder(singleTodoVM))
      ..addAll(_todoValidDate(singleTodoVM))
      ..addAll(_todoLevelBuilder(singleTodoVM))
      ..addAll(_todoLocationBuilder(singleTodoVM))
      ..add(10.hGap)
      ..add(_saveBtnBuilder(singleTodoVM));

    return Padding(
      padding: const EdgeInsetsDirectional.all(5),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: form,
        ),
      ),
    );
  }

  List<Widget> _todoContentBuilder(SingleTodoVM vm) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: _wholePadding,
            child: Text(
              S.of(context).todo_edit_content_label,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          )
        ],
      ),
      Padding(
        padding: _wholePadding,
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
            contentPadding: _wholePadding,
          ),
          style: _singleTodoVM.formFieldSimpleTextStyle(Colors.black),
        ),
      ),
    ];
  }

  List<Widget> _todoRemarkBuilder(SingleTodoVM vm) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: _wholePadding,
            child: Text(
              S.of(context).todo_edit_desc_label,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          )
        ],
      ),
      Padding(
        padding: _wholePadding,
        child: TextFormField(
          controller: vm.descController,
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
            contentPadding: _wholePadding,
          ),
          style: vm.formFieldSimpleTextStyle(Colors.black),
        ),
      ),
    ];
  }

  List<Widget> _subTaskBuilder(SingleTodoVM vm) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: _wholePadding,
            child: Text(
              S.of(context).todo_edit_subtask_label,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Padding(
            padding: _wholePadding,
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
        padding: _wholePadding,
        child: SizedBox(
          width: ScreenUtil.getInstance().screenWidth - 2 * _wholePadding.start,
          child: ProviderWidget<SubTaskListVM>(
              model: vm.subTaskListVM,
              onModelReady: (vm) => vm.init(),
              builder: (ctx, vm, child) {
                return WidgetSubTaskList(vm).transformToPageWidget();
              }),
        ),
      ),
    ];
  }

  List<Widget> _todoValidDate(SingleTodoVM vm) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: _wholePadding,
            child: Text(
              S.of(context).todo_edit_valid_date_label,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Padding(
            padding: _wholePadding,
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
        padding: _wholePadding,
        child: RadioButtonGroup(
          key: vm.todoDateBtnGroupKey,
          buttonGroupLabels: [
            S.of(context).todo_edit_valid_date_btn_today,
            S.of(context).todo_edit_valid_date_btn_tomorrow,
            S.of(context).todo_edit_valid_date_btn_select_date,
            S.of(context).todo_edit_valid_date_btn_draft,
          ],
          buttonGroupIcons: const [AliIcons.IconFlag, AliIcons.IconDocument, AliIcons.IconTime, AliIcons.IconTasklist],
          defaultSelectedIndex: vm.getSelectDateIndex(),
          onButtonChanged: (preIndex, index) async {
            switch (index) {
              case 0:
                {
                  vm.todoForm.selectDate = DateTime.now();
                }
                break;
              case 1:
                {
                  vm.todoForm.selectDate = DayDateUtil.tomorrow();
                }
                break;
              case 2:
                {
                  DateTime? selectDate = await push(PageMonthCalendar(
                    barrierDismissible: false,
                  ));
                  int selectDateBtnIndex = vm.getRightSelectDateBtnIndex(selectDate);
                  vm.todoForm.selectDate = selectDateBtnIndex == 0
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
                  vm.todoForm.selectDate = null;
                }
                break;
            }
            return index;
          },
          variableButtonLabels: [
            VariableButtonLabel(2, (nextIndex, currStatus) {
              if (nextIndex == 2) {
                return vm.todoForm.selectedDate?.yyyyMMdd;
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
    ];
  }

  List<Widget> _todoLevelBuilder(SingleTodoVM vm) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: _wholePadding,
            child: Text(
              S.of(context).todo_edit_level_label,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          )
        ],
      ),
      Padding(
        padding: _wholePadding,
        child: RadioButtonGroup(
          key: vm.todoLevelBtnGroupKey,
          buttonGroupLabels: [
            S.of(context).todo_edit_level_btn_deferrable,
            S.of(context).todo_edit_level_btn_unimportant,
            S.of(context).todo_edit_level_btn_normal,
            S.of(context).todo_edit_level_btn_important,
            S.of(context).todo_edit_level_btn_urgent
          ],
          buttonGroupIcons: const [AliIcons.IconDynamic, AliIcons.IconOrder, AliIcons.IconZhtn, AliIcons.IconShake, AliIcons.IconWarning],
          customSelectedButtonColor: vm.levelCustomBtnGroupColor,
          selectedButtonColor: Colors.teal,
          unSelectedButtonColor: const Color(0xFFD6D6D6),
          selectedLabelColor: Colors.white,
          unSelectedLabelColor: Colors.white,
          horizontal: true,
          defaultSelectedIndex: vm.isNew ? 2 : vm.todoForm.level,
        ),
      ),
    ];
  }

  List<Widget> _todoLocationBuilder(SingleTodoVM vm) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: _wholePadding,
            child: Text(
              S.of(context).todo_edit_location_label,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          )
        ],
      ),
      Padding(
        padding: _wholePadding,
        child: TextFormField(
          controller: vm.locationController,
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
            contentPadding: _wholePadding,
          ),
          style: vm.formFieldSimpleTextStyle(Colors.black),
        ),
      ),
    ];
  }

  Widget _saveBtnBuilder(SingleTodoVM vm) {
    return Padding(
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
                    bool saveSuccess = await vm.save();
                    if (!saveSuccess) {
                      SnackBarUtil.snack(simpleContent: S.of(context).todo_edit_toast_save_failure);
                    } else {
                      SnackBarUtil.snack(simpleContent: S.of(context).todo_edit_toast_save_success);
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
                  disabledColor: const Color(0xFFD6D6D6),
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
    );
  }
}
