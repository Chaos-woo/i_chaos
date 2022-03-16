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
