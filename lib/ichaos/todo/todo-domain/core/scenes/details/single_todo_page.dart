import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/ichaos/public/ali_icons.dart';
import 'package:i_chaos/ichaos/public/widgets/button-group/radio_button_group.dart';
import 'package:i_chaos/ichaos/public/widgets/button-group/variable_button_label.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_level.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/details/single_todo_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/details/todo_detail_form.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/pages/month_calendar_page.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:provider/provider.dart';

class SingleTodoPage extends PageState with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final TodoVO _originalTodo;
  late SingleTodoVM _singleTodoVM;

  SingleTodoPage(this._originalTodo);

  @override
  void initState() {
    super.initState();
    _singleTodoVM = SingleTodoVM(_originalTodo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return switchStatusBar2Dark(
        child: ProviderWidget<SingleTodoVM>(
            model: _singleTodoVM,
            builder: (ctx, singleTodoListVM, child) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    _singleTodoVM.isNew ? _singleTodoVM.appBarTitleOfAdd : _singleTodoVM.appBarTitleOfEdit,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  toolbarHeight: 40,
                  actions: <Widget>[
                    IconButton(
                        onPressed: () {
                          // 展示重置按钮
                        },
                        icon: const Icon(AliIcons.ALI_ICON_SWITCH))
                  ],
                ),
                body: KeyboardAvoider(
                  autoScroll: true,
                  child: _buildForm(_singleTodoVM),
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
              children: const <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    '快记录下要做什么?',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
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
              children: const <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    '描述一下呗?',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
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
              children: const <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    '是哪天需要提醒?',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                )
              ],
            ),
            Padding(
              padding: wholePadding,
              child: RadioButtonGroup(
                buttonGroupLabels: const [
                  TodoDetailFormVO.todayBtnText,
                  TodoDetailFormVO.tomorrowBtnText,
                  TodoDetailFormVO.chooseDateBtnText,
                  TodoDetailFormVO.noDateBtnText
                ],
                buttonGroupIcons: const [AliIcons.ALI_ICON_FLAG, AliIcons.ALI_ICON_DOCUMENT, AliIcons.ALI_ICON_TIME, AliIcons.ALI_ICON_SERVICE],
                onButtonChanged: (preIndex, index) async {
                  switch (index) {
                    case 0: {
                      _singleTodoVM.detailForm.selectDate = DateTime.now();
                    }
                    break;
                    case 1: {
                      _singleTodoVM.detailForm.selectDate = DayDateUtil.tomorrow();
                    }
                    break;
                    case 2: {
                      DateTime? selectDate = await push(MonthCalendarPage(canBeCloseByTouchTransparentArea: false));
                      _singleTodoVM.detailForm.selectDate = selectDate ?? DateTime.now();
                    }
                    break;
                    default : {
                      _singleTodoVM.detailForm.selectDate = null;
                    }
                    break;
                  }
                  return _singleTodoVM.detailForm.selectedDate;
                },
                variableButtonLabels: [
                  VariableButtonLabel(2, (nextIndex, currStatus) {
                    if (nextIndex == 2) {
                      return _singleTodoVM.detailForm.selectedDate?.yyyyMMdd;
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
              children: const <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    '很重要的事情会排在前面喔!',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                )
              ],
            ),
            Padding(
              padding: wholePadding,
              child: RadioButtonGroup(
                buttonGroupLabels: [
                  TodoLevel.deferrable.title,
                  TodoLevel.unimportant.title,
                  TodoLevel.normal.title,
                  TodoLevel.important.title,
                  TodoLevel.urgent.title,
                ],
                customSelectedButtonColor: [
                  TodoLevel.deferrable.color,
                  TodoLevel.unimportant.color,
                  TodoLevel.normal.color,
                  TodoLevel.important.color,
                  TodoLevel.urgent.color,
                ],
                selectedButtonColor: Colors.teal,
                unSelectedButtonColor: const Color(0xFFD6D6D6),
                selectedLabelColor: Colors.white,
                unSelectedLabelColor: Colors.white,
                horizontal: true,
                defaultSelectedIndex: _singleTodoVM.isNew ? 2 : _singleTodoVM.detailForm.level,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: wholePadding,
                  child: Text(
                    '需要记录下地点吗?',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40, 24, 40, 0),
              child: Selector<SingleTodoVM, bool>(
                selector: (ctx, vm) => vm.btnDisable,
                shouldRebuild: (pre, next) => pre != next,
                builder: (ctx, btnDisable, _) {
                  return !btnDisable
                      ? GFButton(
                          text: '保存',
                          textStyle: const TextStyle(fontFamily: 'Lexend Deca', fontSize: 15),
                          onPressed: () async {},
                          icon: const Icon(
                            AliIcons.ALI_ICON_TASK,
                            color: Colors.white,
                          ),
                          color: Colors.teal,
                          size: GFSize.LARGE,
                          fullWidthButton: true,
                        )
                      : const GFButton(
                          text: '保存',
                          textStyle: TextStyle(fontFamily: 'Lexend Deca', fontSize: 15),
                          onPressed: null,
                          disabledColor: Color(0xFFD6D6D6),
                          disabledTextColor: Colors.white,
                          icon: Icon(
                            AliIcons.ALI_ICON_TASK,
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
