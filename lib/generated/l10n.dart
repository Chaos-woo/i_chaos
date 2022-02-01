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

  /// `refresh`
  String get bedrock_refreshTwoLevel {
    return Intl.message(
      'refresh',
      name: 'bedrock_refreshTwoLevel',
      desc: '',
      args: [],
    );
  }

  /// `reset`
  String get bedrock_reset {
    return Intl.message(
      'reset',
      name: 'bedrock_reset',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get bedrock_confirm {
    return Intl.message(
      'confirm',
      name: 'bedrock_confirm',
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

  /// `Edit`
  String get todo_edit_appbar_title_edit {
    return Intl.message(
      'Edit',
      name: 'todo_edit_appbar_title_edit',
      desc: '',
      args: [],
    );
  }

  /// `Add a ToDO`
  String get todo_edit_appbar_title_add {
    return Intl.message(
      'Add a ToDO',
      name: 'todo_edit_appbar_title_add',
      desc: '',
      args: [],
    );
  }

  /// `reset`
  String get todo_edit_reset {
    return Intl.message(
      'reset',
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

  /// `Sub task`
  String get todo_edit_subtask_label {
    return Intl.message(
      'Sub task',
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

  /// `Completed`
  String get todo_card_option_btn_completed {
    return Intl.message(
      'Completed',
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

  /// `Deleted ε==3`
  String get todo_card_toast_delete_text1 {
    return Intl.message(
      'Deleted ε==3',
      name: 'todo_card_toast_delete_text1',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get todo_card_toast_delete_text2 {
    return Intl.message(
      'Task',
      name: 'todo_card_toast_delete_text2',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations~(o≖◡≖)`
  String get todo_card_toast_completed_text1 {
    return Intl.message(
      'Congratulations~(o≖◡≖)',
      name: 'todo_card_toast_completed_text1',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get todo_card_toast_completed_text2 {
    return Intl.message(
      'Task',
      name: 'todo_card_toast_completed_text2',
      desc: '',
      args: [],
    );
  }

  /// `has been completed`
  String get todo_card_toast_completed_text3 {
    return Intl.message(
      'has been completed',
      name: 'todo_card_toast_completed_text3',
      desc: '',
      args: [],
    );
  }

  /// `Right? (O_O)?`
  String get todo_card_toast_unaccomplished_text1 {
    return Intl.message(
      'Right? (O_O)?',
      name: 'todo_card_toast_unaccomplished_text1',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get todo_card_toast_unaccomplished_text2 {
    return Intl.message(
      'Task',
      name: 'todo_card_toast_unaccomplished_text2',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations~(o≖◡≖)`
  String get todo_card_toast_subtask_completed_text1 {
    return Intl.message(
      'Congratulations~(o≖◡≖)',
      name: 'todo_card_toast_subtask_completed_text1',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get todo_card_toast_subtask_completed_text2 {
    return Intl.message(
      'Task',
      name: 'todo_card_toast_subtask_completed_text2',
      desc: '',
      args: [],
    );
  }

  /// `has been completed`
  String get todo_card_toast_subtask_completed_text3 {
    return Intl.message(
      'has been completed',
      name: 'todo_card_toast_subtask_completed_text3',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! Go~(o≖◡≖)`
  String get todo_card_toast_subtask_completed_text4 {
    return Intl.message(
      'Congratulations! Go~(o≖◡≖)',
      name: 'todo_card_toast_subtask_completed_text4',
      desc: '',
      args: [],
    );
  }

  /// `Sub task`
  String get todo_card_toast_subtask_completed_text5 {
    return Intl.message(
      'Sub task',
      name: 'todo_card_toast_subtask_completed_text5',
      desc: '',
      args: [],
    );
  }

  /// `has been completed`
  String get todo_card_toast_subtask_completed_text6 {
    return Intl.message(
      'has been completed',
      name: 'todo_card_toast_subtask_completed_text6',
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
