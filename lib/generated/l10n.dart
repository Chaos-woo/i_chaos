// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Refresh`
  String get bedrock_refreshTwoLevel {
    return Intl.message(
      'Refresh',
      name: 'bedrock_refreshTwoLevel',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get bedrock_reset {
    return Intl.message(
      'Reset',
      name: 'bedrock_reset',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get bedrock_confirm {
    return Intl.message(
      'Confirm',
      name: 'bedrock_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Assert`
  String get app_tab_assert {
    return Intl.message(
      'Assert',
      name: 'app_tab_assert',
      desc: '',
      args: [],
    );
  }

  /// `Feed`
  String get app_tab_feed {
    return Intl.message(
      'Feed',
      name: 'app_tab_feed',
      desc: '',
      args: [],
    );
  }

  /// `Me-log`
  String get app_tab_log {
    return Intl.message(
      'Me-log',
      name: 'app_tab_log',
      desc: '',
      args: [],
    );
  }

  /// `ToDOs`
  String get app_tab_todos {
    return Intl.message(
      'ToDOs',
      name: 'app_tab_todos',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get app_tab_setting {
    return Intl.message(
      'Setting',
      name: 'app_tab_setting',
      desc: '',
      args: [],
    );
  }

  /// `Running error`
  String get app_default_exception_page_title {
    return Intl.message(
      'Running error',
      name: 'app_default_exception_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, some problems happened with the application. \nCould you please click the Feedback button to submit information to help developers analyze the problems?`
  String get app_default_exception_page_tip {
    return Intl.message(
      'Sorry, some problems happened with the application. \nCould you please click the Feedback button to submit information to help developers analyze the problems?',
      name: 'app_default_exception_page_tip',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get app_default_exception_page_action_btn_feedback {
    return Intl.message(
      'Feedback',
      name: 'app_default_exception_page_action_btn_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Thanks~`
  String get app_default_exception_page_action_toast_feedback {
    return Intl.message(
      'Thanks~',
      name: 'app_default_exception_page_action_toast_feedback',
      desc: '',
      args: [],
    );
  }

  /// `{custom_params}`
  String common_custom_params(Object custom_params) {
    return Intl.message(
      '$custom_params',
      name: 'common_custom_params',
      desc: '',
      args: [custom_params],
    );
  }

  /// `Designing...`
  String get common_designing_label {
    return Intl.message(
      'Designing...',
      name: 'common_designing_label',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get month_calendar_page_btn_confirm {
    return Intl.message(
      'Ok',
      name: 'month_calendar_page_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get month_calendar_page_btn_cancel {
    return Intl.message(
      'Cancel',
      name: 'month_calendar_page_btn_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Edit ToDO`
  String get todo_edit_appbar_title_edit {
    return Intl.message(
      'Edit ToDO',
      name: 'todo_edit_appbar_title_edit',
      desc: '',
      args: [],
    );
  }

  /// `New ToDO`
  String get todo_edit_appbar_title_add {
    return Intl.message(
      'New ToDO',
      name: 'todo_edit_appbar_title_add',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get todo_edit_reset {
    return Intl.message(
      'Reset',
      name: 'todo_edit_reset',
      desc: '',
      args: [],
    );
  }

  /// `ToDO Content`
  String get todo_edit_content_label {
    return Intl.message(
      'ToDO Content',
      name: 'todo_edit_content_label',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get todo_edit_desc_label {
    return Intl.message(
      'Description',
      name: 'todo_edit_desc_label',
      desc: '',
      args: [],
    );
  }

  /// `Sub task(s)`
  String get todo_edit_subtask_label {
    return Intl.message(
      'Sub task(s)',
      name: 'todo_edit_subtask_label',
      desc: '',
      args: [],
    );
  }

  /// `What is sub task ?`
  String get todo_edit_subtask_tip_title {
    return Intl.message(
      'What is sub task ?',
      name: 'todo_edit_subtask_tip_title',
      desc: '',
      args: [],
    );
  }

  /// `1. A ToDO contains some sub tasks, such as SubTask1, SubTask2.\n2. If a ToDO contains N sub tasks, your work completion is 1/N when you completed a sub task.\n3. ToDO will move to completed list when all its sub tasks had completed.\n4. If a ToDO completed, it's all sub tasks will be displayed as completed.`
  String get todo_edit_subtask_tip_content {
    return Intl.message(
      '1. A ToDO contains some sub tasks, such as SubTask1, SubTask2.\n2. If a ToDO contains N sub tasks, your work completion is 1/N when you completed a sub task.\n3. ToDO will move to completed list when all its sub tasks had completed.\n4. If a ToDO completed, it\'s all sub tasks will be displayed as completed.',
      name: 'todo_edit_subtask_tip_content',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get todo_edit_subtask_tip_btn_confirm {
    return Intl.message(
      'Ok',
      name: 'todo_edit_subtask_tip_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Valid date`
  String get todo_edit_valid_date_label {
    return Intl.message(
      'Valid date',
      name: 'todo_edit_valid_date_label',
      desc: '',
      args: [],
    );
  }

  /// `How to select valid date ?`
  String get todo_edit_valid_date_tip_title {
    return Intl.message(
      'How to select valid date ?',
      name: 'todo_edit_valid_date_tip_title',
      desc: '',
      args: [],
    );
  }

  /// `1. [Today]: This ToDO will be displayed today.\n2. [Tomorrow]:  This ToDO will be displayed tomorrow.\n3. [Select date]: You can select any date after today. But, if it is today or tomorrow, the option will change to [Today] or [Tomorrow] button.\n4. [Draft]: ToDO will not be shown on any ToDO list before you select a valid date.`
  String get todo_edit_valid_date_tip_content {
    return Intl.message(
      '1. [Today]: This ToDO will be displayed today.\n2. [Tomorrow]:  This ToDO will be displayed tomorrow.\n3. [Select date]: You can select any date after today. But, if it is today or tomorrow, the option will change to [Today] or [Tomorrow] button.\n4. [Draft]: ToDO will not be shown on any ToDO list before you select a valid date.',
      name: 'todo_edit_valid_date_tip_content',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get todo_edit_valid_date_tip_btn_confirm {
    return Intl.message(
      'Ok',
      name: 'todo_edit_valid_date_tip_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get todo_edit_valid_date_btn_today {
    return Intl.message(
      'Today',
      name: 'todo_edit_valid_date_btn_today',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get todo_edit_valid_date_btn_tomorrow {
    return Intl.message(
      'Tomorrow',
      name: 'todo_edit_valid_date_btn_tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Select date`
  String get todo_edit_valid_date_btn_select_date {
    return Intl.message(
      'Select date',
      name: 'todo_edit_valid_date_btn_select_date',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get todo_edit_valid_date_btn_draft {
    return Intl.message(
      'Draft',
      name: 'todo_edit_valid_date_btn_draft',
      desc: '',
      args: [],
    );
  }

  /// `Emergency degree`
  String get todo_edit_level_label {
    return Intl.message(
      'Emergency degree',
      name: 'todo_edit_level_label',
      desc: '',
      args: [],
    );
  }

  /// `Deferrable`
  String get todo_edit_level_btn_deferrable {
    return Intl.message(
      'Deferrable',
      name: 'todo_edit_level_btn_deferrable',
      desc: '',
      args: [],
    );
  }

  /// `Unimportant`
  String get todo_edit_level_btn_unimportant {
    return Intl.message(
      'Unimportant',
      name: 'todo_edit_level_btn_unimportant',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get todo_edit_level_btn_normal {
    return Intl.message(
      'Normal',
      name: 'todo_edit_level_btn_normal',
      desc: '',
      args: [],
    );
  }

  /// `Important`
  String get todo_edit_level_btn_important {
    return Intl.message(
      'Important',
      name: 'todo_edit_level_btn_important',
      desc: '',
      args: [],
    );
  }

  /// `Urgent`
  String get todo_edit_level_btn_urgent {
    return Intl.message(
      'Urgent',
      name: 'todo_edit_level_btn_urgent',
      desc: '',
      args: [],
    );
  }

  /// `Location information`
  String get todo_edit_location_label {
    return Intl.message(
      'Location information',
      name: 'todo_edit_location_label',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get todo_edit_btn_save {
    return Intl.message(
      'Save',
      name: 'todo_edit_btn_save',
      desc: '',
      args: [],
    );
  }

  /// `Save success !`
  String get todo_edit_toast_save_success {
    return Intl.message(
      'Save success !',
      name: 'todo_edit_toast_save_success',
      desc: '',
      args: [],
    );
  }

  /// `Save failure, please try again.`
  String get todo_edit_toast_save_failure {
    return Intl.message(
      'Save failure, please try again.',
      name: 'todo_edit_toast_save_failure',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get todo_week_label_abbr_mon {
    return Intl.message(
      'Mon',
      name: 'todo_week_label_abbr_mon',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get todo_week_label_abbr_tue {
    return Intl.message(
      'Tue',
      name: 'todo_week_label_abbr_tue',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get todo_week_label_abbr_wed {
    return Intl.message(
      'Wed',
      name: 'todo_week_label_abbr_wed',
      desc: '',
      args: [],
    );
  }

  /// `Thu`
  String get todo_week_label_abbr_thu {
    return Intl.message(
      'Thu',
      name: 'todo_week_label_abbr_thu',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get todo_week_label_abbr_fri {
    return Intl.message(
      'Fri',
      name: 'todo_week_label_abbr_fri',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get todo_week_label_abbr_sat {
    return Intl.message(
      'Sat',
      name: 'todo_week_label_abbr_sat',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get todo_week_label_abbr_sun {
    return Intl.message(
      'Sun',
      name: 'todo_week_label_abbr_sun',
      desc: '',
      args: [],
    );
  }

  /// `More options`
  String get todo_card_more_option {
    return Intl.message(
      'More options',
      name: 'todo_card_more_option',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get todo_card_option_btn_completed {
    return Intl.message(
      'Done',
      name: 'todo_card_option_btn_completed',
      desc: '',
      args: [],
    );
  }

  /// `Modify`
  String get todo_card_option_btn_modify {
    return Intl.message(
      'Modify',
      name: 'todo_card_option_btn_modify',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get todo_card_option_btn_delete {
    return Intl.message(
      'Delete',
      name: 'todo_card_option_btn_delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete ToDO ?`
  String get todo_card_option_btn_delete_tip_title {
    return Intl.message(
      'Delete ToDO ?',
      name: 'todo_card_option_btn_delete_tip_title',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get todo_card_option_btn_delete_tip_confirm {
    return Intl.message(
      'Yes',
      name: 'todo_card_option_btn_delete_tip_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get todo_card_option_btn_delete_tip_cancel {
    return Intl.message(
      'Cancel',
      name: 'todo_card_option_btn_delete_tip_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Not finished`
  String get todo_card_option_btn_unaccomplished {
    return Intl.message(
      'Not finished',
      name: 'todo_card_option_btn_unaccomplished',
      desc: '',
      args: [],
    );
  }

  /// `retract`
  String get todo_card_subtask_btn_retract {
    return Intl.message(
      'retract',
      name: 'todo_card_subtask_btn_retract',
      desc: '',
      args: [],
    );
  }

  /// `ToDO Detail`
  String get todo_card_detail_query_title {
    return Intl.message(
      'ToDO Detail',
      name: 'todo_card_detail_query_title',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get todo_card_detail_query_btn_confirm {
    return Intl.message(
      'Ok',
      name: 'todo_card_detail_query_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get todo_card_detail_query_content_label {
    return Intl.message(
      'Content',
      name: 'todo_card_detail_query_content_label',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get todo_card_detail_query_desc_label {
    return Intl.message(
      'Description',
      name: 'todo_card_detail_query_desc_label',
      desc: '',
      args: [],
    );
  }

  /// `Emergency degree`
  String get todo_card_detail_query_level_label {
    return Intl.message(
      'Emergency degree',
      name: 'todo_card_detail_query_level_label',
      desc: '',
      args: [],
    );
  }

  /// `status`
  String get todo_card_detail_query_is_completed_label {
    return Intl.message(
      'status',
      name: 'todo_card_detail_query_is_completed_label',
      desc: '',
      args: [],
    );
  }

  /// `Doing`
  String get todo_card_detail_query_has_completed {
    return Intl.message(
      'Doing',
      name: 'todo_card_detail_query_has_completed',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get todo_card_detail_query_not_completed {
    return Intl.message(
      'Done',
      name: 'todo_card_detail_query_not_completed',
      desc: '',
      args: [],
    );
  }

  /// `Completed date`
  String get todo_card_detail_query_completed_date_label {
    return Intl.message(
      'Completed date',
      name: 'todo_card_detail_query_completed_date_label',
      desc: '',
      args: [],
    );
  }

  /// `Location information`
  String get todo_card_detail_query_location_label {
    return Intl.message(
      'Location information',
      name: 'todo_card_detail_query_location_label',
      desc: '',
      args: [],
    );
  }

  /// `Sub task(s)`
  String get todo_card_detail_query_subtask_label {
    return Intl.message(
      'Sub task(s)',
      name: 'todo_card_detail_query_subtask_label',
      desc: '',
      args: [],
    );
  }

  /// `Valid date`
  String get todo_card_detail_query_valid_date_label {
    return Intl.message(
      'Valid date',
      name: 'todo_card_detail_query_valid_date_label',
      desc: '',
      args: [],
    );
  }

  /// `Create date`
  String get todo_card_detail_query_crete_date_label {
    return Intl.message(
      'Create date',
      name: 'todo_card_detail_query_crete_date_label',
      desc: '',
      args: [],
    );
  }

  /// `Update date`
  String get todo_card_detail_query_update_date_label {
    return Intl.message(
      'Update date',
      name: 'todo_card_detail_query_update_date_label',
      desc: '',
      args: [],
    );
  }

  /// `☀`
  String get todo_home_fba_btn_today {
    return Intl.message(
      '☀',
      name: 'todo_home_fba_btn_today',
      desc: '',
      args: [],
    );
  }

  /// `Searching`
  String get todo_filtered_tab_bar_loading_label {
    return Intl.message(
      'Searching',
      name: 'todo_filtered_tab_bar_loading_label',
      desc: '',
      args: [],
    );
  }

  /// `Underway`
  String get todo_filtered_tab_bar_state_active {
    return Intl.message(
      'Underway',
      name: 'todo_filtered_tab_bar_state_active',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get todo_filtered_tab_bar_state_completed {
    return Intl.message(
      'Completed',
      name: 'todo_filtered_tab_bar_state_completed',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get todo_filtered_tab_bar_state_all {
    return Intl.message(
      'All',
      name: 'todo_filtered_tab_bar_state_all',
      desc: '',
      args: [],
    );
  }

  /// `ToDO Deleted`
  String get todo_card_toast_delete_text1 {
    return Intl.message(
      'ToDO Deleted',
      name: 'todo_card_toast_delete_text1',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations~\nToDO completed`
  String get todo_card_toast_completed_text1 {
    return Intl.message(
      'Congratulations~\nToDO completed',
      name: 'todo_card_toast_completed_text1',
      desc: '',
      args: [],
    );
  }

  /// `ToDO not finished`
  String get todo_card_toast_unaccomplished_text1 {
    return Intl.message(
      'ToDO not finished',
      name: 'todo_card_toast_unaccomplished_text1',
      desc: '',
      args: [],
    );
  }

  /// `Sub task(s) all completed`
  String get todo_card_toast_subtask_completed_text1 {
    return Intl.message(
      'Sub task(s) all completed',
      name: 'todo_card_toast_subtask_completed_text1',
      desc: '',
      args: [],
    );
  }

  /// `Sub task completed`
  String get todo_card_toast_subtask_completed_text4 {
    return Intl.message(
      'Sub task completed',
      name: 'todo_card_toast_subtask_completed_text4',
      desc: '',
      args: [],
    );
  }

  /// `No more data`
  String get todo_list_placeholder_no_data {
    return Intl.message(
      'No more data',
      name: 'todo_list_placeholder_no_data',
      desc: '',
      args: [],
    );
  }

  /// `Not found`
  String get todo_list_placeholder_not_found {
    return Intl.message(
      'Not found',
      name: 'todo_list_placeholder_not_found',
      desc: '',
      args: [],
    );
  }

  /// `All done of ToDO`
  String get todo_list_placeholder_completed {
    return Intl.message(
      'All done of ToDO',
      name: 'todo_list_placeholder_completed',
      desc: '',
      args: [],
    );
  }

  /// `Still has unfinished ToDO`
  String get todo_list_placeholder_more_todo {
    return Intl.message(
      'Still has unfinished ToDO',
      name: 'todo_list_placeholder_more_todo',
      desc: '',
      args: [],
    );
  }

  /// `Date has been switched to`
  String get todo_calendar_switch_toast_text1 {
    return Intl.message(
      'Date has been switched to',
      name: 'todo_calendar_switch_toast_text1',
      desc: '',
      args: [],
    );
  }

  /// `Draft list`
  String get todo_draft_page_appbar_title {
    return Intl.message(
      'Draft list',
      name: 'todo_draft_page_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete all`
  String get todo_draft_appbar_option_delete_all {
    return Intl.message(
      'Delete all',
      name: 'todo_draft_appbar_option_delete_all',
      desc: '',
      args: [],
    );
  }

  /// `Delete all draft ?`
  String get todo_draft_appbar_option_delete_all_tip_title {
    return Intl.message(
      'Delete all draft ?',
      name: 'todo_draft_appbar_option_delete_all_tip_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete all draft and can not found any ?`
  String get todo_draft_appbar_option_delete_all_tip_content {
    return Intl.message(
      'Delete all draft and can not found any ?',
      name: 'todo_draft_appbar_option_delete_all_tip_content',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get todo_draft_appbar_option_delete_all_tip_btn_confirm {
    return Intl.message(
      'Yes',
      name: 'todo_draft_appbar_option_delete_all_tip_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get todo_draft_appbar_option_delete_all_tip_btn_cancel {
    return Intl.message(
      'Cancel',
      name: 'todo_draft_appbar_option_delete_all_tip_btn_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Move to Today`
  String get todo_draft_list_item_option_move_to_today {
    return Intl.message(
      'Move to Today',
      name: 'todo_draft_list_item_option_move_to_today',
      desc: '',
      args: [],
    );
  }

  /// `Move to Tomorrow`
  String get todo_draft_list_item_option_move_to_tomorrow {
    return Intl.message(
      'Move to Tomorrow',
      name: 'todo_draft_list_item_option_move_to_tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get todo_draft_list_item_option_select_date {
    return Intl.message(
      'Select Date',
      name: 'todo_draft_list_item_option_select_date',
      desc: '',
      args: [],
    );
  }

  /// `Modify`
  String get todo_draft_list_item_option_modify {
    return Intl.message(
      'Modify',
      name: 'todo_draft_list_item_option_modify',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get todo_draft_list_item_option_delete {
    return Intl.message(
      'Delete',
      name: 'todo_draft_list_item_option_delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete draft ?`
  String get todo_draft_list_item_option_delete_tip_title {
    return Intl.message(
      'Delete draft ?',
      name: 'todo_draft_list_item_option_delete_tip_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete draft ?`
  String get todo_draft_list_item_option_delete_tip_content {
    return Intl.message(
      'Delete draft ?',
      name: 'todo_draft_list_item_option_delete_tip_content',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get todo_draft_list_item_option_delete_tip_btn_confirm {
    return Intl.message(
      'Yes',
      name: 'todo_draft_list_item_option_delete_tip_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get todo_draft_list_item_option_delete_tip_btn_cancel {
    return Intl.message(
      'Cancel',
      name: 'todo_draft_list_item_option_delete_tip_btn_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Not found any draft ...`
  String get todo_draft_list_not_found_tip_text {
    return Intl.message(
      'Not found any draft ...',
      name: 'todo_draft_list_not_found_tip_text',
      desc: '',
      args: [],
    );
  }

  /// `Basic list`
  String get tag_drawer_item_tip_basic {
    return Intl.message(
      'Basic list',
      name: 'tag_drawer_item_tip_basic',
      desc: '',
      args: [],
    );
  }

  /// `Tagged list`
  String get tag_drawer_item_tip_tag {
    return Intl.message(
      'Tagged list',
      name: 'tag_drawer_item_tip_tag',
      desc: '',
      args: [],
    );
  }

  /// `Daily ToDOs`
  String get tag_drawer_item_daily_todo {
    return Intl.message(
      'Daily ToDOs',
      name: 'tag_drawer_item_daily_todo',
      desc: '',
      args: [],
    );
  }

  /// `Recently ToDOs`
  String get tag_drawer_item_recently_todo {
    return Intl.message(
      'Recently ToDOs',
      name: 'tag_drawer_item_recently_todo',
      desc: '',
      args: [],
    );
  }

  /// `ToDOs without tag`
  String get tag_drawer_item_no_tag_todo {
    return Intl.message(
      'ToDOs without tag',
      name: 'tag_drawer_item_no_tag_todo',
      desc: '',
      args: [],
    );
  }

  /// `New tag`
  String get tag_drawer_item_new_tag {
    return Intl.message(
      'New tag',
      name: 'tag_drawer_item_new_tag',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get tag_drawer_menu_item_edit {
    return Intl.message(
      'Edit',
      name: 'tag_drawer_menu_item_edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get tag_drawer_menu_item_delete {
    return Intl.message(
      'Delete',
      name: 'tag_drawer_menu_item_delete',
      desc: '',
      args: [],
    );
  }

  /// `Want to delete this tag ?`
  String get tag_drawer_menu_item_delete_tip_title {
    return Intl.message(
      'Want to delete this tag ?',
      name: 'tag_drawer_menu_item_delete_tip_title',
      desc: '',
      args: [],
    );
  }

  /// `Tag information: \n1. Tag name: {name};\n2. Create date: {createTime}.\n 3. Tips: all of ToDOs of the tag will remove from list after deleting this tag.`
  String tag_drawer_menu_item_delete_tip_content(
      Object name, Object createTime) {
    return Intl.message(
      'Tag information: \n1. Tag name: $name;\n2. Create date: $createTime.\n 3. Tips: all of ToDOs of the tag will remove from list after deleting this tag.',
      name: 'tag_drawer_menu_item_delete_tip_content',
      desc: '',
      args: [name, createTime],
    );
  }

  /// `Yes`
  String get tag_drawer_menu_item_delete_tip_btn_confirm {
    return Intl.message(
      'Yes',
      name: 'tag_drawer_menu_item_delete_tip_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get tag_drawer_menu_item_delete_tip_btn_cancel {
    return Intl.message(
      'Cancel',
      name: 'tag_drawer_menu_item_delete_tip_btn_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get tag_drawer_menu_item_sort {
    return Intl.message(
      'Sort',
      name: 'tag_drawer_menu_item_sort',
      desc: '',
      args: [],
    );
  }

  /// `Sort tag(s)`
  String get tag_sort_appbar_title {
    return Intl.message(
      'Sort tag(s)',
      name: 'tag_sort_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `No tag, let's create ...`
  String get tag_sort_tag_list_empty_tip {
    return Intl.message(
      'No tag, let\'s create ...',
      name: 'tag_sort_tag_list_empty_tip',
      desc: '',
      args: [],
    );
  }

  /// `Up`
  String get tag_sort_item_btn_move_up_text {
    return Intl.message(
      'Up',
      name: 'tag_sort_item_btn_move_up_text',
      desc: '',
      args: [],
    );
  }

  /// `Down`
  String get tag_sort_item_btn_move_down_text {
    return Intl.message(
      'Down',
      name: 'tag_sort_item_btn_move_down_text',
      desc: '',
      args: [],
    );
  }

  /// `New tag`
  String get tag_detail_appbar_title_new {
    return Intl.message(
      'New tag',
      name: 'tag_detail_appbar_title_new',
      desc: '',
      args: [],
    );
  }

  /// `Edit tag`
  String get tag_detail_appbar_title_edit {
    return Intl.message(
      'Edit tag',
      name: 'tag_detail_appbar_title_edit',
      desc: '',
      args: [],
    );
  }

  /// `Pick up a color you like and edit tag name`
  String get tag_detail_tag_info_label {
    return Intl.message(
      'Pick up a color you like and edit tag name',
      name: 'tag_detail_tag_info_label',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get tag_detail_btn_confirm {
    return Intl.message(
      'Save',
      name: 'tag_detail_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get tag_detail_color_picker_btn_confirm {
    return Intl.message(
      'Ok',
      name: 'tag_detail_color_picker_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `empty tag name, please input some text`
  String get tag_detail_save_tip_empty_name {
    return Intl.message(
      'empty tag name, please input some text',
      name: 'tag_detail_save_tip_empty_name',
      desc: '',
      args: [],
    );
  }

  /// `duplicate tag name, please input different name`
  String get tag_detail_save_tip_duplicate_name {
    return Intl.message(
      'duplicate tag name, please input different name',
      name: 'tag_detail_save_tip_duplicate_name',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting_page_appbar_title {
    return Intl.message(
      'Setting',
      name: 'setting_page_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Basic setting`
  String get setting_page_group_tip_text1 {
    return Intl.message(
      'Basic setting',
      name: 'setting_page_group_tip_text1',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get setting_option_language_text {
    return Intl.message(
      'Language',
      name: 'setting_option_language_text',
      desc: '',
      args: [],
    );
  }

  /// `{choice, select, lan_0 {Simplified Chinese} lan_1 {English}}`
  String setting_language_set_options(Object choice) {
    return Intl.select(
      choice,
      {
        'lan_0': 'Simplified Chinese',
        'lan_1': 'English',
      },
      name: 'setting_language_set_options',
      desc: '',
      args: [choice],
    );
  }

  /// `Simplified Chinese`
  String get setting_language_set_text1 {
    return Intl.message(
      'Simplified Chinese',
      name: 'setting_language_set_text1',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get setting_language_set_text2 {
    return Intl.message(
      'English',
      name: 'setting_language_set_text2',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get setting_option_theme_text {
    return Intl.message(
      'Theme',
      name: 'setting_option_theme_text',
      desc: '',
      args: [],
    );
  }

  /// `{choice, select, theme_0 {Bahama Blue} theme_1 {Mandy Red} theme_2 {Money} theme_3 {Mango} theme_4 {Espresso} theme_5 {San Juan Blue} theme_6 {Red Wine} theme_7 {forest}}`
  String setting_theme_set_options(Object choice) {
    return Intl.select(
      choice,
      {
        'theme_0': 'Bahama Blue',
        'theme_1': 'Mandy Red',
        'theme_2': 'Money',
        'theme_3': 'Mango',
        'theme_4': 'Espresso',
        'theme_5': 'San Juan Blue',
        'theme_6': 'Red Wine',
        'theme_7': 'forest',
      },
      name: 'setting_theme_set_options',
      desc: '',
      args: [choice],
    );
  }

  /// `Theme mode`
  String get setting_option_theme_mode_text {
    return Intl.message(
      'Theme mode',
      name: 'setting_option_theme_mode_text',
      desc: '',
      args: [],
    );
  }

  /// `{choice, select, mode_0 {Auto (System)} mode_1 {Light} mode_2 {Dark}}`
  String setting_theme_mode_set_options(Object choice) {
    return Intl.select(
      choice,
      {
        'mode_0': 'Auto (System)',
        'mode_1': 'Light',
        'mode_2': 'Dark',
      },
      name: 'setting_theme_mode_set_options',
      desc: '',
      args: [choice],
    );
  }

  /// `Font`
  String get setting_option_text_font_text {
    return Intl.message(
      'Font',
      name: 'setting_option_text_font_text',
      desc: '',
      args: [],
    );
  }

  /// `Example: \nAlmost before we knew it, we had left the ground.\n几乎在我们意识到之前，我们已经离开了地面。\n1234567890`
  String get setting_option_text_font_set_display_text {
    return Intl.message(
      'Example: \nAlmost before we knew it, we had left the ground.\n几乎在我们意识到之前，我们已经离开了地面。\n1234567890',
      name: 'setting_option_text_font_set_display_text',
      desc: '',
      args: [],
    );
  }

  /// `Support fonts`
  String get setting_option_text_font_tip_text1 {
    return Intl.message(
      'Support fonts',
      name: 'setting_option_text_font_tip_text1',
      desc: '',
      args: [],
    );
  }

  /// `Assert`
  String get main_bottombar_widget_tab_text_assert {
    return Intl.message(
      'Assert',
      name: 'main_bottombar_widget_tab_text_assert',
      desc: '',
      args: [],
    );
  }

  /// `Feed`
  String get main_bottombar_widget_tab_text_feed {
    return Intl.message(
      'Feed',
      name: 'main_bottombar_widget_tab_text_feed',
      desc: '',
      args: [],
    );
  }

  /// `Me-log`
  String get main_bottombar_widget_tab_text_log {
    return Intl.message(
      'Me-log',
      name: 'main_bottombar_widget_tab_text_log',
      desc: '',
      args: [],
    );
  }

  /// `ToDOs`
  String get main_bottombar_widget_tab_text_todos {
    return Intl.message(
      'ToDOs',
      name: 'main_bottombar_widget_tab_text_todos',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get main_bottombar_widget_tab_text_setting {
    return Intl.message(
      'Setting',
      name: 'main_bottombar_widget_tab_text_setting',
      desc: '',
      args: [],
    );
  }

  /// `Running error`
  String get common_exception_page_appbar_title {
    return Intl.message(
      'Running error',
      name: 'common_exception_page_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, some problems happened with the application. \nCould you please click the Feedback button to submit information to help developers analyze the problems?`
  String get common_exception_page_tip_text {
    return Intl.message(
      'Sorry, some problems happened with the application. \nCould you please click the Feedback button to submit information to help developers analyze the problems?',
      name: 'common_exception_page_tip_text',
      desc: '',
      args: [],
    );
  }

  /// `Submit error information`
  String get common_exception_page_btn_tooltip_text_submit {
    return Intl.message(
      'Submit error information',
      name: 'common_exception_page_btn_tooltip_text_submit',
      desc: '',
      args: [],
    );
  }

  /// `Thanks~`
  String get common_exception_page_toast_text_submit {
    return Intl.message(
      'Thanks~',
      name: 'common_exception_page_toast_text_submit',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get common_ok_button {
    return Intl.message(
      'Ok',
      name: 'common_ok_button',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get common_cancel_button {
    return Intl.message(
      'Cancel',
      name: 'common_cancel_button',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get common_confirm_button {
    return Intl.message(
      'Confirm',
      name: 'common_confirm_button',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get common_delete_button {
    return Intl.message(
      'Delete',
      name: 'common_delete_button',
      desc: '',
      args: [],
    );
  }

  /// `Confirm deletion?`
  String get common_delete_title {
    return Intl.message(
      'Confirm deletion?',
      name: 'common_delete_title',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get common_save_button {
    return Intl.message(
      'Save',
      name: 'common_save_button',
      desc: '',
      args: [],
    );
  }

  /// `please input something`
  String get common_hint_plz_input {
    return Intl.message(
      'please input something',
      name: 'common_hint_plz_input',
      desc: '',
      args: [],
    );
  }

  /// `{custom_params}`
  String common_any_text(Object custom_params) {
    return Intl.message(
      '$custom_params',
      name: 'common_any_text',
      desc: '',
      args: [custom_params],
    );
  }

  /// `Designing...`
  String get common_any_page_label_text_design {
    return Intl.message(
      'Designing...',
      name: 'common_any_page_label_text_design',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get common_month_calendar_page_btn_text_confirm {
    return Intl.message(
      'Ok',
      name: 'common_month_calendar_page_btn_text_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get common_month_calendar_page_btn_text_cancel {
    return Intl.message(
      'Cancel',
      name: 'common_month_calendar_page_btn_text_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Edit ToDO`
  String get todos_edit_page_appbar_title_edit {
    return Intl.message(
      'Edit ToDO',
      name: 'todos_edit_page_appbar_title_edit',
      desc: '',
      args: [],
    );
  }

  /// `New ToDO`
  String get todos_edit_page_appbar_title_add {
    return Intl.message(
      'New ToDO',
      name: 'todos_edit_page_appbar_title_add',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get todos_edit_page_appbar_action_btn_reset {
    return Intl.message(
      'Reset',
      name: 'todos_edit_page_appbar_action_btn_reset',
      desc: '',
      args: [],
    );
  }

  /// `ToDO Brief`
  String get todos_edit_page_label_title_content {
    return Intl.message(
      'ToDO Brief',
      name: 'todos_edit_page_label_title_content',
      desc: '',
      args: [],
    );
  }

  /// `brief of ToDO`
  String get todos_edit_page_label_subtitle_content {
    return Intl.message(
      'brief of ToDO',
      name: 'todos_edit_page_label_subtitle_content',
      desc: '',
      args: [],
    );
  }

  /// `Using simple text to describe the ToDO so that you can quickly understand it.`
  String get todos_edit_page_dialog_content_content {
    return Intl.message(
      'Using simple text to describe the ToDO so that you can quickly understand it.',
      name: 'todos_edit_page_dialog_content_content',
      desc: '',
      args: [],
    );
  }

  /// `brief can not empty.`
  String get todos_edit_page_error_tip_content {
    return Intl.message(
      'brief can not empty.',
      name: 'todos_edit_page_error_tip_content',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get todos_edit_page_label_title_remark {
    return Intl.message(
      'Description',
      name: 'todos_edit_page_label_title_remark',
      desc: '',
      args: [],
    );
  }

  /// `writing more details of ToDO`
  String get todos_edit_page_label_subtitle_remark {
    return Intl.message(
      'writing more details of ToDO',
      name: 'todos_edit_page_label_subtitle_remark',
      desc: '',
      args: [],
    );
  }

  /// `More Details or remarks.`
  String get todos_edit_page_dialog_content_remark {
    return Intl.message(
      'More Details or remarks.',
      name: 'todos_edit_page_dialog_content_remark',
      desc: '',
      args: [],
    );
  }

  /// `Sub task(s)`
  String get todos_edit_page_label_title_subtask {
    return Intl.message(
      'Sub task(s)',
      name: 'todos_edit_page_label_title_subtask',
      desc: '',
      args: [],
    );
  }

  /// `task flow or points for attention Of ToDO`
  String get todos_edit_page_label_subtitle_subtask {
    return Intl.message(
      'task flow or points for attention Of ToDO',
      name: 'todos_edit_page_label_subtitle_subtask',
      desc: '',
      args: [],
    );
  }

  /// `task ({number}):`
  String todos_edit_page_label_title_subtask_dummy_exist(Object number) {
    return Intl.message(
      'task ($number):',
      name: 'todos_edit_page_label_title_subtask_dummy_exist',
      desc: '',
      args: [number],
    );
  }

  /// `please input task content:`
  String get todos_edit_page_label_title_subtask_dummy_new {
    return Intl.message(
      'please input task content:',
      name: 'todos_edit_page_label_title_subtask_dummy_new',
      desc: '',
      args: [],
    );
  }

  /// `New Sub task cannot be empty`
  String get todos_edit_page_toast_empty_tip_subtask_new {
    return Intl.message(
      'New Sub task cannot be empty',
      name: 'todos_edit_page_toast_empty_tip_subtask_new',
      desc: '',
      args: [],
    );
  }

  /// `What is sub task?`
  String get todos_edit_page_dialog_title_subtask {
    return Intl.message(
      'What is sub task?',
      name: 'todos_edit_page_dialog_title_subtask',
      desc: '',
      args: [],
    );
  }

  /// `1. A ToDO contains some sub tasks, such as SubTask1, SubTask2.\n2. If a ToDO contains N sub tasks, your work completion is 1/N when you completed a sub task.\n3. ToDO will move to completed list when all its sub tasks had completed.\n4. If a ToDO completed, it's all sub tasks will be displayed as completed.`
  String get todos_edit_page_dialog_content_subtask {
    return Intl.message(
      '1. A ToDO contains some sub tasks, such as SubTask1, SubTask2.\n2. If a ToDO contains N sub tasks, your work completion is 1/N when you completed a sub task.\n3. ToDO will move to completed list when all its sub tasks had completed.\n4. If a ToDO completed, it\'s all sub tasks will be displayed as completed.',
      name: 'todos_edit_page_dialog_content_subtask',
      desc: '',
      args: [],
    );
  }

  /// `Valid date`
  String get todos_edit_page_label_title_valid_date {
    return Intl.message(
      'Valid date',
      name: 'todos_edit_page_label_title_valid_date',
      desc: '',
      args: [],
    );
  }

  /// `choice a you want to prompt date`
  String get todos_edit_page_label_subtitle_valid_date {
    return Intl.message(
      'choice a you want to prompt date',
      name: 'todos_edit_page_label_subtitle_valid_date',
      desc: '',
      args: [],
    );
  }

  /// `How to select valid date?`
  String get todos_edit_page_dialog_title_valid_date {
    return Intl.message(
      'How to select valid date?',
      name: 'todos_edit_page_dialog_title_valid_date',
      desc: '',
      args: [],
    );
  }

  /// `1. [Today]: This ToDO will be displayed today.\n2. [Tomorrow]:  This ToDO will be displayed tomorrow.\n3. [Select date]: You can select any date after today. But, if it is today or tomorrow, the option will change to [Today] or [Tomorrow] button.\n4. [Draft]: ToDO will not be shown on any ToDO list before you select a valid date.`
  String get todos_edit_page_dialog_content_valid_date {
    return Intl.message(
      '1. [Today]: This ToDO will be displayed today.\n2. [Tomorrow]:  This ToDO will be displayed tomorrow.\n3. [Select date]: You can select any date after today. But, if it is today or tomorrow, the option will change to [Today] or [Tomorrow] button.\n4. [Draft]: ToDO will not be shown on any ToDO list before you select a valid date.',
      name: 'todos_edit_page_dialog_content_valid_date',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get todos_edit_page_option_valid_date_today {
    return Intl.message(
      'Today',
      name: 'todos_edit_page_option_valid_date_today',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get todos_edit_page_option_valid_date_tomorrow {
    return Intl.message(
      'Tomorrow',
      name: 'todos_edit_page_option_valid_date_tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Select date`
  String get todos_edit_page_option_valid_date_select_date {
    return Intl.message(
      'Select date',
      name: 'todos_edit_page_option_valid_date_select_date',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get todos_edit_page_option_valid_date_draft {
    return Intl.message(
      'Draft',
      name: 'todos_edit_page_option_valid_date_draft',
      desc: '',
      args: [],
    );
  }

  /// `Switch to today`
  String get todos_edit_page_dialog_valid_date_btn_switch_to_today {
    return Intl.message(
      'Switch to today',
      name: 'todos_edit_page_dialog_valid_date_btn_switch_to_today',
      desc: '',
      args: [],
    );
  }

  /// `Emergency degree`
  String get todos_edit_page_label_title_level {
    return Intl.message(
      'Emergency degree',
      name: 'todos_edit_page_label_title_level',
      desc: '',
      args: [],
    );
  }

  /// `more urgent and more important ToDO will place forward.`
  String get todos_edit_page_label_subtitle_level {
    return Intl.message(
      'more urgent and more important ToDO will place forward.',
      name: 'todos_edit_page_label_subtitle_level',
      desc: '',
      args: [],
    );
  }

  /// `todo...`
  String get todos_edit_page_dialog_content_level {
    return Intl.message(
      'todo...',
      name: 'todos_edit_page_dialog_content_level',
      desc: '',
      args: [],
    );
  }

  /// `Unimportant\nNot urgent`
  String get todos_edit_page_option_level_unimportant_not_urgent {
    return Intl.message(
      'Unimportant\nNot urgent',
      name: 'todos_edit_page_option_level_unimportant_not_urgent',
      desc: '',
      args: [],
    );
  }

  /// `Important\nNot urgent`
  String get todos_edit_page_option_level_important_not_urgent {
    return Intl.message(
      'Important\nNot urgent',
      name: 'todos_edit_page_option_level_important_not_urgent',
      desc: '',
      args: [],
    );
  }

  /// `Urgent\nUnimportant`
  String get todos_edit_page_option_level_urgent_unimportant {
    return Intl.message(
      'Urgent\nUnimportant',
      name: 'todos_edit_page_option_level_urgent_unimportant',
      desc: '',
      args: [],
    );
  }

  /// `Urgent\nImportant`
  String get todos_edit_page_option_level_urgent_important {
    return Intl.message(
      'Urgent\nImportant',
      name: 'todos_edit_page_option_level_urgent_important',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get todos_edit_page_label_title_location {
    return Intl.message(
      'Address',
      name: 'todos_edit_page_label_title_location',
      desc: '',
      args: [],
    );
  }

  /// `writing address information avoid forgetting.`
  String get todos_edit_page_label_subtitle_location {
    return Intl.message(
      'writing address information avoid forgetting.',
      name: 'todos_edit_page_label_subtitle_location',
      desc: '',
      args: [],
    );
  }

  /// `Save success !`
  String get todos_edit_page_toast_save_success {
    return Intl.message(
      'Save success !',
      name: 'todos_edit_page_toast_save_success',
      desc: '',
      args: [],
    );
  }

  /// `Save failure, please try again.`
  String get todos_edit_page_toast_save_failure {
    return Intl.message(
      'Save failure, please try again.',
      name: 'todos_edit_page_toast_save_failure',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get todos_main_page_widget_label_week_abbr_mon {
    return Intl.message(
      'Mon',
      name: 'todos_main_page_widget_label_week_abbr_mon',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get todos_main_page_widget_label_week_abbr_tue {
    return Intl.message(
      'Tue',
      name: 'todos_main_page_widget_label_week_abbr_tue',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get todos_main_page_widget_label_week_abbr_wed {
    return Intl.message(
      'Wed',
      name: 'todos_main_page_widget_label_week_abbr_wed',
      desc: '',
      args: [],
    );
  }

  /// `Thu`
  String get todos_main_page_widget_label_week_abbr_thu {
    return Intl.message(
      'Thu',
      name: 'todos_main_page_widget_label_week_abbr_thu',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get todos_main_page_widget_label_week_abbr_fri {
    return Intl.message(
      'Fri',
      name: 'todos_main_page_widget_label_week_abbr_fri',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get todos_main_page_widget_label_week_abbr_sat {
    return Intl.message(
      'Sat',
      name: 'todos_main_page_widget_label_week_abbr_sat',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get todos_main_page_widget_label_week_abbr_sun {
    return Intl.message(
      'Sun',
      name: 'todos_main_page_widget_label_week_abbr_sun',
      desc: '',
      args: [],
    );
  }

  /// `More options`
  String get todos_todo_card_widget_menu_title {
    return Intl.message(
      'More options',
      name: 'todos_todo_card_widget_menu_title',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get todos_todo_card_widget_option_completed {
    return Intl.message(
      'Done',
      name: 'todos_todo_card_widget_option_completed',
      desc: '',
      args: [],
    );
  }

  /// `Modify`
  String get todos_todo_card_widget_option_modify {
    return Intl.message(
      'Modify',
      name: 'todos_todo_card_widget_option_modify',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get todos_todo_card_widget_option_delete {
    return Intl.message(
      'Delete',
      name: 'todos_todo_card_widget_option_delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete ToDO?`
  String get todos_todo_card_widget_dialog_title_delete {
    return Intl.message(
      'Delete ToDO?',
      name: 'todos_todo_card_widget_dialog_title_delete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get todos_todo_card_widget_dialog_delete_btn_confirm {
    return Intl.message(
      'Yes',
      name: 'todos_todo_card_widget_dialog_delete_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get todos_todo_card_widget_dialog_delete_btn_cancel {
    return Intl.message(
      'Cancel',
      name: 'todos_todo_card_widget_dialog_delete_btn_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Not finished`
  String get todos_todo_card_widget_option_unaccomplished {
    return Intl.message(
      'Not finished',
      name: 'todos_todo_card_widget_option_unaccomplished',
      desc: '',
      args: [],
    );
  }

  /// `retract`
  String get todos_todo_card_widget_btn_subtask_retract {
    return Intl.message(
      'retract',
      name: 'todos_todo_card_widget_btn_subtask_retract',
      desc: '',
      args: [],
    );
  }

  /// `ToDO Detail`
  String get todos_todo_card_detail_widget_dialog_title {
    return Intl.message(
      'ToDO Detail',
      name: 'todos_todo_card_detail_widget_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get todos_todo_card_detail_widget_dialog_btn_confirm {
    return Intl.message(
      'Ok',
      name: 'todos_todo_card_detail_widget_dialog_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get todos_todo_card_detail_widget_dialog_content_label {
    return Intl.message(
      'Content',
      name: 'todos_todo_card_detail_widget_dialog_content_label',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get todos_todo_card_detail_widget_dialog_remark_label {
    return Intl.message(
      'Description',
      name: 'todos_todo_card_detail_widget_dialog_remark_label',
      desc: '',
      args: [],
    );
  }

  /// `Emergency degree`
  String get todos_todo_card_detail_widget_dialog_level_label {
    return Intl.message(
      'Emergency degree',
      name: 'todos_todo_card_detail_widget_dialog_level_label',
      desc: '',
      args: [],
    );
  }

  /// `status`
  String get todos_todo_card_detail_widget_dialog_status_label {
    return Intl.message(
      'status',
      name: 'todos_todo_card_detail_widget_dialog_status_label',
      desc: '',
      args: [],
    );
  }

  /// `Doing`
  String get todos_todo_card_detail_widget_dialog_status_text_doing {
    return Intl.message(
      'Doing',
      name: 'todos_todo_card_detail_widget_dialog_status_text_doing',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get todos_todo_card_detail_widget_dialog_status_text_completed {
    return Intl.message(
      'Done',
      name: 'todos_todo_card_detail_widget_dialog_status_text_completed',
      desc: '',
      args: [],
    );
  }

  /// `Completed date`
  String get todos_todo_card_detail_widget_dialog_completed_date_label {
    return Intl.message(
      'Completed date',
      name: 'todos_todo_card_detail_widget_dialog_completed_date_label',
      desc: '',
      args: [],
    );
  }

  /// `Location information`
  String get todos_todo_card_detail_widget_dialog_location_label {
    return Intl.message(
      'Location information',
      name: 'todos_todo_card_detail_widget_dialog_location_label',
      desc: '',
      args: [],
    );
  }

  /// `Sub task(s)`
  String get todos_todo_card_detail_widget_dialog_subtask_label {
    return Intl.message(
      'Sub task(s)',
      name: 'todos_todo_card_detail_widget_dialog_subtask_label',
      desc: '',
      args: [],
    );
  }

  /// `Valid date`
  String get todos_todo_card_detail_widget_dialog_valid_date_label {
    return Intl.message(
      'Valid date',
      name: 'todos_todo_card_detail_widget_dialog_valid_date_label',
      desc: '',
      args: [],
    );
  }

  /// `Create date`
  String get todos_todo_card_detail_widget_dialog_crete_date_label {
    return Intl.message(
      'Create date',
      name: 'todos_todo_card_detail_widget_dialog_crete_date_label',
      desc: '',
      args: [],
    );
  }

  /// `Update date`
  String get todos_todo_card_detail_widget_dialog_update_date_label {
    return Intl.message(
      'Update date',
      name: 'todos_todo_card_detail_widget_dialog_update_date_label',
      desc: '',
      args: [],
    );
  }

  /// `☀`
  String get todos_home_fba_widget_btn_today {
    return Intl.message(
      '☀',
      name: 'todos_home_fba_widget_btn_today',
      desc: '',
      args: [],
    );
  }

  /// `Searching`
  String get todos_tabbar_widget_tip_filtered_loading {
    return Intl.message(
      'Searching',
      name: 'todos_tabbar_widget_tip_filtered_loading',
      desc: '',
      args: [],
    );
  }

  /// `Underway`
  String get todos_tabbar_widget_label_filtered_active {
    return Intl.message(
      'Underway',
      name: 'todos_tabbar_widget_label_filtered_active',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get todos_tabbar_widget_label_filtered_completed {
    return Intl.message(
      'Completed',
      name: 'todos_tabbar_widget_label_filtered_completed',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get todos_tabbar_widget_label_filtered_all {
    return Intl.message(
      'All',
      name: 'todos_tabbar_widget_label_filtered_all',
      desc: '',
      args: [],
    );
  }

  /// `ToDO Deleted`
  String get todos_todo_card_widget_toast_text_deleted {
    return Intl.message(
      'ToDO Deleted',
      name: 'todos_todo_card_widget_toast_text_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations~ ToDO completed`
  String get todos_todo_card_widget_toast_text_completed {
    return Intl.message(
      'Congratulations~ ToDO completed',
      name: 'todos_todo_card_widget_toast_text_completed',
      desc: '',
      args: [],
    );
  }

  /// `ToDO not finished`
  String get todos_todo_card_widget_toast_text_unaccomplished {
    return Intl.message(
      'ToDO not finished',
      name: 'todos_todo_card_widget_toast_text_unaccomplished',
      desc: '',
      args: [],
    );
  }

  /// `Sub task(s) all completed`
  String get todos_todo_card_widget_toast_text_all_subtask_completed {
    return Intl.message(
      'Sub task(s) all completed',
      name: 'todos_todo_card_widget_toast_text_all_subtask_completed',
      desc: '',
      args: [],
    );
  }

  /// `Sub task completed`
  String get todos_todo_card_widget_toast_text_subtask_completed {
    return Intl.message(
      'Sub task completed',
      name: 'todos_todo_card_widget_toast_text_subtask_completed',
      desc: '',
      args: [],
    );
  }

  /// `No more data`
  String get todos_main_page_todo_list_tip_no_data {
    return Intl.message(
      'No more data',
      name: 'todos_main_page_todo_list_tip_no_data',
      desc: '',
      args: [],
    );
  }

  /// `Not found`
  String get todos_main_page_todo_list_tip_not_found {
    return Intl.message(
      'Not found',
      name: 'todos_main_page_todo_list_tip_not_found',
      desc: '',
      args: [],
    );
  }

  /// `All done of ToDO`
  String get todos_main_page_todo_list_tip_completed {
    return Intl.message(
      'All done of ToDO',
      name: 'todos_main_page_todo_list_tip_completed',
      desc: '',
      args: [],
    );
  }

  /// `Still has unfinished ToDO`
  String get todos_main_page_todo_list_tip_has_more_todos {
    return Intl.message(
      'Still has unfinished ToDO',
      name: 'todos_main_page_todo_list_tip_has_more_todos',
      desc: '',
      args: [],
    );
  }

  /// `Date has been switched to`
  String get todos_calendar_switch_widget_toast_text_date_jump {
    return Intl.message(
      'Date has been switched to',
      name: 'todos_calendar_switch_widget_toast_text_date_jump',
      desc: '',
      args: [],
    );
  }

  /// `Draft list`
  String get todos_draft_page_appbar_title {
    return Intl.message(
      'Draft list',
      name: 'todos_draft_page_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete all`
  String get todos_draft_page_appbar_option_delete_all {
    return Intl.message(
      'Delete all',
      name: 'todos_draft_page_appbar_option_delete_all',
      desc: '',
      args: [],
    );
  }

  /// `Delete all draft?`
  String get todos_draft_page_appbar_dialog_delete_all_title {
    return Intl.message(
      'Delete all draft?',
      name: 'todos_draft_page_appbar_dialog_delete_all_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete all draft and can not found any?`
  String get todos_draft_page_appbar_dialog_delete_all_content {
    return Intl.message(
      'Delete all draft and can not found any?',
      name: 'todos_draft_page_appbar_dialog_delete_all_content',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get todos_draft_page_appbar_dialog_btn_delete_all_confirm {
    return Intl.message(
      'Yes',
      name: 'todos_draft_page_appbar_dialog_btn_delete_all_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get todos_draft_page_appbar_dialog_btn_delete_all_cancel {
    return Intl.message(
      'Cancel',
      name: 'todos_draft_page_appbar_dialog_btn_delete_all_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Move to Today`
  String get todos_draft_page_list_item_option_move_to_today {
    return Intl.message(
      'Move to Today',
      name: 'todos_draft_page_list_item_option_move_to_today',
      desc: '',
      args: [],
    );
  }

  /// `Move to Tomorrow`
  String get todos_draft_page_list_option_move_to_tomorrow {
    return Intl.message(
      'Move to Tomorrow',
      name: 'todos_draft_page_list_option_move_to_tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get todos_draft_page_list_option_select_date {
    return Intl.message(
      'Select Date',
      name: 'todos_draft_page_list_option_select_date',
      desc: '',
      args: [],
    );
  }

  /// `Modify`
  String get todos_draft_page_list_option_modify {
    return Intl.message(
      'Modify',
      name: 'todos_draft_page_list_option_modify',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get todos_draft_page_list_item_option_delete {
    return Intl.message(
      'Delete',
      name: 'todos_draft_page_list_item_option_delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete draft?`
  String get todos_draft_page_list_dialog_delete_title {
    return Intl.message(
      'Delete draft?',
      name: 'todos_draft_page_list_dialog_delete_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete draft?`
  String get todos_draft_page_list_dialog_delete_content {
    return Intl.message(
      'Delete draft?',
      name: 'todos_draft_page_list_dialog_delete_content',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get todos_draft_page_list_dialog_btn_delete_confirm {
    return Intl.message(
      'Yes',
      name: 'todos_draft_page_list_dialog_btn_delete_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get todos_draft_page_list_dialog_btn_delete_cancel {
    return Intl.message(
      'Cancel',
      name: 'todos_draft_page_list_dialog_btn_delete_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Not found any draft ...`
  String get todos_draft_page_list_tip_not_found {
    return Intl.message(
      'Not found any draft ...',
      name: 'todos_draft_page_list_tip_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Basic list`
  String get todos_drawer_page_tip_basic_list {
    return Intl.message(
      'Basic list',
      name: 'todos_drawer_page_tip_basic_list',
      desc: '',
      args: [],
    );
  }

  /// `Tagged list`
  String get todos_drawer_page_tip_tagged_list {
    return Intl.message(
      'Tagged list',
      name: 'todos_drawer_page_tip_tagged_list',
      desc: '',
      args: [],
    );
  }

  /// `Daily ToDOs`
  String get todos_drawer_page_option_daily_todo {
    return Intl.message(
      'Daily ToDOs',
      name: 'todos_drawer_page_option_daily_todo',
      desc: '',
      args: [],
    );
  }

  /// `Recently ToDOs`
  String get todos_drawer_page_option_recently_todo {
    return Intl.message(
      'Recently ToDOs',
      name: 'todos_drawer_page_option_recently_todo',
      desc: '',
      args: [],
    );
  }

  /// `ToDOs without tag`
  String get todos_drawer_page_option_no_tag_todo {
    return Intl.message(
      'ToDOs without tag',
      name: 'todos_drawer_page_option_no_tag_todo',
      desc: '',
      args: [],
    );
  }

  /// `New tag`
  String get todos_drawer_page_option_new_tag {
    return Intl.message(
      'New tag',
      name: 'todos_drawer_page_option_new_tag',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get todos_drawer_page_menu_tag_edit {
    return Intl.message(
      'Edit',
      name: 'todos_drawer_page_menu_tag_edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get todos_drawer_page_menu_tag_delete {
    return Intl.message(
      'Delete',
      name: 'todos_drawer_page_menu_tag_delete',
      desc: '',
      args: [],
    );
  }

  /// `Want to delete this tag?`
  String get todos_drawer_page_dialog_delete_tag_title {
    return Intl.message(
      'Want to delete this tag?',
      name: 'todos_drawer_page_dialog_delete_tag_title',
      desc: '',
      args: [],
    );
  }

  /// `Tag information: \n1. Tag name: {name};\n2. Create date: {createTime}.\n 3. Tips: all of ToDOs of the tag will remove from list after deleting this tag.`
  String todos_drawer_page_dialog_delete_tag_content(
      Object name, Object createTime) {
    return Intl.message(
      'Tag information: \n1. Tag name: $name;\n2. Create date: $createTime.\n 3. Tips: all of ToDOs of the tag will remove from list after deleting this tag.',
      name: 'todos_drawer_page_dialog_delete_tag_content',
      desc: '',
      args: [name, createTime],
    );
  }

  /// `Yes`
  String get todos_drawer_page_dialog_delete_tag_btn_confirm {
    return Intl.message(
      'Yes',
      name: 'todos_drawer_page_dialog_delete_tag_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get todos_drawer_page_dialog_delete_tag_btn_cancel {
    return Intl.message(
      'Cancel',
      name: 'todos_drawer_page_dialog_delete_tag_btn_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get todos_drawer_page_menu_tag_sort {
    return Intl.message(
      'Sort',
      name: 'todos_drawer_page_menu_tag_sort',
      desc: '',
      args: [],
    );
  }

  /// `Sort tag(s)`
  String get todos_tag_sort_page_appbar_title {
    return Intl.message(
      'Sort tag(s)',
      name: 'todos_tag_sort_page_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `No tag, let's create ...`
  String get todos_tag_sort_page_tag_list_tip_empty {
    return Intl.message(
      'No tag, let\'s create ...',
      name: 'todos_tag_sort_page_tag_list_tip_empty',
      desc: '',
      args: [],
    );
  }

  /// `Up`
  String get todos_tag_sort_page_tag_list_btn_move_up {
    return Intl.message(
      'Up',
      name: 'todos_tag_sort_page_tag_list_btn_move_up',
      desc: '',
      args: [],
    );
  }

  /// `Down`
  String get todos_tag_sort_page_tag_list_btn_move_down {
    return Intl.message(
      'Down',
      name: 'todos_tag_sort_page_tag_list_btn_move_down',
      desc: '',
      args: [],
    );
  }

  /// `New tag`
  String get todos_tag_detail_page_appbar_title_new {
    return Intl.message(
      'New tag',
      name: 'todos_tag_detail_page_appbar_title_new',
      desc: '',
      args: [],
    );
  }

  /// `Edit tag`
  String get todos_tag_detail_page_appbar_title_edit {
    return Intl.message(
      'Edit tag',
      name: 'todos_tag_detail_page_appbar_title_edit',
      desc: '',
      args: [],
    );
  }

  /// `Pick up a color you like and edit tag name`
  String get todos_tag_detail_page_label_input_tip {
    return Intl.message(
      'Pick up a color you like and edit tag name',
      name: 'todos_tag_detail_page_label_input_tip',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get todos_tag_detail_page_btn_save {
    return Intl.message(
      'Save',
      name: 'todos_tag_detail_page_btn_save',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get todos_tag_detail_page_dialog_color_picker_btn_confirm {
    return Intl.message(
      'Ok',
      name: 'todos_tag_detail_page_dialog_color_picker_btn_confirm',
      desc: '',
      args: [],
    );
  }

  /// `empty tag name, please input some text`
  String get todos_tag_detail_page_toast_text_empty_name {
    return Intl.message(
      'empty tag name, please input some text',
      name: 'todos_tag_detail_page_toast_text_empty_name',
      desc: '',
      args: [],
    );
  }

  /// `duplicate tag name, please input different name`
  String get todos_tag_detail_page_toast_text_duplicate_name {
    return Intl.message(
      'duplicate tag name, please input different name',
      name: 'todos_tag_detail_page_toast_text_duplicate_name',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting_main_page_appbar_title {
    return Intl.message(
      'Setting',
      name: 'setting_main_page_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Basic setting`
  String get setting_main_page_tip_base_setting {
    return Intl.message(
      'Basic setting',
      name: 'setting_main_page_tip_base_setting',
      desc: '',
      args: [],
    );
  }

  /// `Individual setting`
  String get setting_main_page_tip_individual_setting {
    return Intl.message(
      'Individual setting',
      name: 'setting_main_page_tip_individual_setting',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get setting_main_page_option_base_setting_language {
    return Intl.message(
      'Language',
      name: 'setting_main_page_option_base_setting_language',
      desc: '',
      args: [],
    );
  }

  /// `{choice, select, lan_0 {Simplified Chinese} lan_1 {English}}`
  String setting_language_page_option_language_choice(Object choice) {
    return Intl.select(
      choice,
      {
        'lan_0': 'Simplified Chinese',
        'lan_1': 'English',
      },
      name: 'setting_language_page_option_language_choice',
      desc: '',
      args: [choice],
    );
  }

  /// `Theme`
  String get setting_main_page_option_base_setting_theme {
    return Intl.message(
      'Theme',
      name: 'setting_main_page_option_base_setting_theme',
      desc: '',
      args: [],
    );
  }

  /// `{choice, select, theme_0 {Bahama Blue} theme_1 {Mandy Red} theme_2 {Money} theme_3 {Mango} theme_4 {Espresso} theme_5 {San Juan Blue} theme_6 {Red Wine} theme_7 {forest}}`
  String setting_theme_page_option_theme_choice(Object choice) {
    return Intl.select(
      choice,
      {
        'theme_0': 'Bahama Blue',
        'theme_1': 'Mandy Red',
        'theme_2': 'Money',
        'theme_3': 'Mango',
        'theme_4': 'Espresso',
        'theme_5': 'San Juan Blue',
        'theme_6': 'Red Wine',
        'theme_7': 'forest',
      },
      name: 'setting_theme_page_option_theme_choice',
      desc: '',
      args: [choice],
    );
  }

  /// `Theme mode`
  String get setting_main_page_option_base_setting_theme_mode {
    return Intl.message(
      'Theme mode',
      name: 'setting_main_page_option_base_setting_theme_mode',
      desc: '',
      args: [],
    );
  }

  /// `light/dart mode`
  String get setting_main_page_option_base_setting_theme_mode_sub_title {
    return Intl.message(
      'light/dart mode',
      name: 'setting_main_page_option_base_setting_theme_mode_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `{choice, select, mode_0 {Auto mode (System)} mode_1 {Light mode} mode_2 {Dark mode}}`
  String setting_theme_mode_page_option_theme_mode_choice(Object choice) {
    return Intl.select(
      choice,
      {
        'mode_0': 'Auto mode (System)',
        'mode_1': 'Light mode',
        'mode_2': 'Dark mode',
      },
      name: 'setting_theme_mode_page_option_theme_mode_choice',
      desc: '',
      args: [choice],
    );
  }

  /// `Font`
  String get setting_main_page_option_base_setting_font {
    return Intl.message(
      'Font',
      name: 'setting_main_page_option_base_setting_font',
      desc: '',
      args: [],
    );
  }

  /// `Example: \nAlmost before we knew it, we had left the ground.\n几乎在我们意识到之前，我们已经离开了地面。\n1234567890`
  String get setting_font_page_text_example {
    return Intl.message(
      'Example: \nAlmost before we knew it, we had left the ground.\n几乎在我们意识到之前，我们已经离开了地面。\n1234567890',
      name: 'setting_font_page_text_example',
      desc: '',
      args: [],
    );
  }

  /// `Support fonts`
  String get setting_font_page_tip_support_fonts {
    return Intl.message(
      'Support fonts',
      name: 'setting_font_page_tip_support_fonts',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
