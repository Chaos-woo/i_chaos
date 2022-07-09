import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_action.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_actions.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_content.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_frame.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_title.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/widget-chain/widget_chain.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/pages/stateless_ctrl_page.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/view_mixin_export.dart';
import 'package:i_chaos/base-getX-framework/view-model/app-model/locale_ctrl.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/extensions/date_time_extension.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_layout.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_level.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/child-editors/todo_sub_task_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/child-editors/todo_valid_date_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/todos_editing_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/calendar-bar/calendar_bar_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/month-calendar/month_calendar_widget.dart';

class TodosEditingPage extends StatelessCtrlPage<TodosEditingCtrl> {
  static const String todoEditBtnBuilderId = 'todo_edit_btn';
  final double _saveOperateFitHeight = 40.0;

  late BrnFormItemConfig _textInputFormItemConfig;
  late BrnFormItemConfig _subTaskTextInputFormItemConfig;
  late BrnFormItemConfig _quickSelectFormItemConfig;

  final LocaleCtrl _localeCtrl = GetXReferenceMixin.findRef();
  final FlexColorThemeCtrl _themeCtrl = GetXReferenceMixin.findRef();
  final CalendarBarCtrl _calendarBarCtrl = GetXReferenceMixin.findRef();

  @override
  void initViewRes() {
    EdgeInsets itemPadding = const EdgeInsets.all(4);
    BrnTextStyle titleTextStyle = BrnTextStyle(
      fontSize: BrnDefaultConfigUtils.defaultCommonConfig.fontSizeHead,
      fontWeight: AppStyle.fontWidget.medium,
    );

    _textInputFormItemConfig = BrnFormItemConfig(
      titleTextStyle: titleTextStyle,
      formPadding: itemPadding,
      contentTextStyle: BrnTextStyle(height: 1.7, textBaseline: TextBaseline.alphabetic),
      hintTextStyle: BrnTextStyle(color: AppStyle.colors.lightGray),
    );

    _subTaskTextInputFormItemConfig = BrnFormItemConfig(
      formPadding: itemPadding,
      contentTextStyle: BrnTextStyle(height: 1.7, textBaseline: TextBaseline.alphabetic),
      hintTextStyle: BrnTextStyle(color: AppStyle.colors.lightGray),
    );

    _quickSelectFormItemConfig = BrnFormItemConfig(
      titleTextStyle: titleTextStyle,
      formPadding: itemPadding,
    );
  }

  @override
  Widget ctrlPageBuilder() {
    double totalContentHeight = screenHeight - NavBarMixin.commonAppBarHeight;

    return Scaffold(
      appBar: backNavBar(
        title: (metaCtrl.editor.todo.isNewer
            ? S.current.todos_edit_page_appbar_title_add
            : S.current.todos_edit_page_appbar_title_edit),
      ),
      body: GetBuilder<TodosEditingCtrl>(
        builder: (_) => _rxBuilder(totalContentHeight),
      ),
    );
  }

  Widget _rxBuilder(double totalContentHeight) {
    List<Widget> formItems = [
      _contentBuilder(),
      _remarkBuilder(),
      _validDateBuilder(),
      _levelBuilder(),
      _subTaskBuilder(),
      _locationBuilder(),
    ];

    return AvoidKeyboard(
      child: Container(
        padding: const EdgeInsetsDirectional.all(5),
        color: _themeCtrl.getFitModeColor(
            lightModeColor: Colors.grey[100], isBackground: true),
        height: totalContentHeight,
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (Widget item in formItems) _paddingWrapper(item),
            BrnBigMainButton(
              title: S.current.common_save_button,
              bgColor: _themeCtrl.getPrimaryColor(),
              onTap: () async {
                bool checkOk = metaCtrl.editor.attrsCheck();
                if (checkOk) {
                  showCenterToast(S.current.todos_edit_page_toast_save_success);
                  bool saveOk = await metaCtrl.saveTodo();
                  if (saveOk) {
                    pop();
                  } else {
                    showCenterToast(S.current.todos_edit_page_toast_save_failure);
                  }
                } else {
                  showCenterToast(S.current.todos_edit_page_toast_save_failure);
                  metaCtrl.updateBuilder();
                }
              },
            )
                .intoSizedBox(height: _saveOperateFitHeight, width: screenWidth - 4)
                .intoPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 20)),
          ],
        )),
      ),
    );
  }

  Widget _paddingWrapper(Widget widget) =>
      widget.intoPadding(padding: AppLayout.padding.v5);

  Widget _contentBuilder() {
    return BrnTextBlockInputFormItem(
      controller: metaCtrl.editor.contentEditor.controller,
      maxCharCount: metaCtrl.maxCharCntOfContent,
      minLines: 1,
      maxLines: 10,
      title: S.current.todos_edit_page_label_title_content,
      subTitle: S.current.todos_edit_page_label_subtitle_content,
      isRequire: true,
      hint: '',
      tipLabel: '',
      error: metaCtrl.editor.contentEditor.attrVerifyErrorTip(),
      onTip: () => showSingleDialog(
        title: DialogTitle.title(title: S.current.todos_edit_page_label_title_content),
        content: DialogContent.content(
            content: S.current.todos_edit_page_dialog_content_content),
      ),
      themeData: _textInputFormItemConfig,
    );
  }

  Widget _remarkBuilder() {
    return BrnTextBlockInputFormItem(
      controller: metaCtrl.editor.remarkEditor.controller,
      maxCharCount: metaCtrl.maxCharCntOfRemark,
      minLines: 1,
      maxLines: 40,
      title: S.current.todos_edit_page_label_title_remark,
      subTitle: S.current.todos_edit_page_label_subtitle_remark,
      isRequire: false,
      hint: '',
      tipLabel: '',
      onTip: () => showSingleDialog(
        title: DialogTitle.title(title: S.current.todos_edit_page_label_title_remark),
        content: DialogContent.content(
            content: S.current.todos_edit_page_dialog_content_remark),
      ),
      themeData: _textInputFormItemConfig,
    );
  }

  Widget _levelBuilder() {
    return BrnTextQuickSelectFormItem(
      key: UniqueKey(),
      title: S.current.todos_edit_page_label_title_level,
      subTitle: S.current.todos_edit_page_label_subtitle_level,
      isRequire: true,
      isBtnsScroll: true,
      hint: '',
      selectBtnList: metaCtrl.editor.levelEditor.levelBtnsSelected,
      btnsTxt: [
        S.current.todos_edit_page_option_level_urgent_important,
        S.current.todos_edit_page_option_level_urgent_unimportant,
        S.current.todos_edit_page_option_level_important_not_urgent,
        S.current.todos_edit_page_option_level_unimportant_not_urgent,
      ],
      onBtnSelectChanged: (int selectedIndex) {
        metaCtrl.editor.levelEditor.selectTodoLevel(TodoLevel.coded(selectedIndex).code);
        metaCtrl.updateBuilder();
      },
      tipLabel: '',
      onTip: () => showSingleDialog(
        title: DialogTitle.title(title: S.current.todos_edit_page_label_title_level),
        content: DialogContent.content(
            content: S.current.todos_edit_page_dialog_content_level),
      ),
      themeData: _quickSelectFormItemConfig,
    );
  }

  Widget _validDateBuilder() {
    bool isPointDateBtnIndex = metaCtrl.editor.validDateEditor.isSelectDateBtnIndex;
    String pointDateText = S.current.todos_edit_page_option_valid_date_select_date;
    if (isPointDateBtnIndex) {
      pointDateText = metaCtrl.editor.validDateEditor.validDate!.yyyyMMdd;
    }

    return BrnTextQuickSelectFormItem(
      key: UniqueKey(),
      title: S.current.todos_edit_page_label_title_valid_date,
      subTitle: S.current.todos_edit_page_label_subtitle_valid_date,
      isRequire: true,
      isBtnsScroll: true,
      hint: '',
      selectBtnList: metaCtrl.editor.validDateEditor.validDateBtnsSelected,
      btnsTxt: [
        S.current.todos_edit_page_option_valid_date_today,
        S.current.todos_edit_page_option_valid_date_tomorrow,
        pointDateText,
        S.current.todos_edit_page_option_valid_date_draft,
      ],
      onBtnSelectChanged: (int selectedIndex) async {
        DateTime? finalSelectedDate;
        if (selectedIndex == TodoValidDateEditor.pointDateBtnIndex) {
          // 该下标需要指定日期的文案
          DateTime? tempSelectedDate =
              metaCtrl.editor.validDateEditor.validDate ?? _calendarBarCtrl.currentDate;
          bool originalValidDateIsNull =
              metaCtrl.editor.validDateEditor.validDate == null;
          final calendar = MonthCalendarWidget(
              initialDate: tempSelectedDate,
              dateChangeCb: (DateTime selectDate) => tempSelectedDate = selectDate);
          final calendarWidget = calendar.selfGenerateStateView(key: UniqueKey());
          await showMultiActionDialog(
            customFrame: DialogFrame(
                needContentSizeBox: false,
                needTitleSizeBox: false,
                clickMaskDismiss: false),
            title: DialogTitle.noTitle(),
            content: DialogContent.content(widget: calendarWidget),
            arrangeType: DialogActionArrangeType.row,
            multiActions: [
              MultiAction(
                S.current.todos_edit_page_dialog_valid_date_btn_switch_to_today,
                () => calendar.jumpToSelectDateQuickly(DateTime.now()),
                clickDismiss: false,
              ),
              MultiAction(
                  S.current.common_ok_button, () => finalSelectedDate = tempSelectedDate),
            ],
          );
        } else if (selectedIndex == TodoValidDateEditor.todayBtnIndex) {
          finalSelectedDate = DateTime.now();
        } else if (selectedIndex == TodoValidDateEditor.tomorrowBtnIndex) {
          finalSelectedDate = DayDateUtil.tomorrow();
        } else {
          finalSelectedDate = null;
        }
        metaCtrl.editor.validDateEditor.selectTodoValidDate(finalSelectedDate);
        metaCtrl.updateBuilder();
      },
      tipLabel: '',
      onTip: () => showSingleDialog(
        title: DialogTitle.title(title: S.current.todos_edit_page_label_title_valid_date),
        content: DialogContent.content(
            content: S.current.todos_edit_page_dialog_content_valid_date),
      ),
      themeData: _quickSelectFormItemConfig,
    );
  }

  Widget _subTaskBuilder() {
    List<SubTaskTempController> wrapperTasks =
        metaCtrl.editor.subTaskEditor.addedWrapperSubTasks;
    List<Widget> taskItems = [];
    for (int i = 0; i < wrapperTasks.length; i++) {
      taskItems.add(_existingSubTaskItem(wrapperTasks[i], i + 1));
    }

    if (metaCtrl.editor.subTaskEditor.needAddEmptyTask) {
      taskItems.add(_emptySubTaskItem(wrapperTasks.length + 1));
    } else {
      if (metaCtrl.editor.subTaskEditor.reachUpperLimit) {
        // 到达上限，清空子任务工作区
        metaCtrl.editor.subTaskEditor.processTooMuchWorkingTasks();
      } else {
        // 子任务工作区不为空
        taskItems.add(_emptySubTaskItem(wrapperTasks.length + 1));
      }
    }

    return BrnNormalFormGroup(
      title: S.current.todos_edit_page_label_title_subtask,
      subTitle: S.current.todos_edit_page_label_subtitle_subtask,
      children: taskItems,
      tipLabel: '',
      onTip: () => showSingleDialog(
        title: DialogTitle.title(title: S.current.todos_edit_page_dialog_title_subtask),
        content: DialogContent.content(
            content: S.current.todos_edit_page_dialog_content_subtask),
      ),
    );
  }

  Widget _existingSubTaskItem(SubTaskTempController task, int dummyNo) {
    return BrnTextBlockInputFormItem(
      key: UniqueKey(),
      title: S.current.todos_edit_page_label_title_subtask_dummy_exist(dummyNo),
      hint: S.current.common_hint_plz_input,
      minLines: 1,
      controller: task.controller,
      onRemoveTap: () {
        metaCtrl.editor.subTaskEditor.removeTask(task.task.uuid);
        metaCtrl.updateBuilder();
      },
      prefixIconType: BrnPrefixIconType.remove,
      themeData: _subTaskTextInputFormItemConfig,
    );
  }

  Widget _emptySubTaskItem(int dummyNo) {
    SubTaskTempController emptyTask = metaCtrl.editor.subTaskEditor.getEmptyTask();
    return BrnTextBlockInputFormItem(
      key: UniqueKey(),
      title: S.current.todos_edit_page_label_title_subtask_dummy_new,
      hint: S.current.common_hint_plz_input,
      minLines: 1,
      controller: emptyTask.controller,
      onAddTap: () {
        if (emptyTask.controller.text.isEmpty) {
          showCenterToast('不能为空');
        } else {
          metaCtrl.editor.subTaskEditor.addTask();
          metaCtrl.updateBuilder();
        }
      },
      prefixIconType: BrnPrefixIconType.add,
      themeData: _subTaskTextInputFormItemConfig,
    );
  }

  Widget _locationBuilder() {
    return BrnTextBlockInputFormItem(
      controller: metaCtrl.editor.locationEditor.controller,
      maxCharCount: metaCtrl.maxCharCntOfLocation,
      minLines: 1,
      maxLines: 5,
      title: S.current.todos_edit_page_label_title_location,
      subTitle: S.current.todos_edit_page_label_subtitle_location,
      isRequire: false,
      hint: '',
      themeData: _textInputFormItemConfig,
    );
  }
}
