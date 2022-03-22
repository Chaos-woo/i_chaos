// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(custom_params) => "${custom_params}";

  static String m1(custom_params) => "${custom_params}";

  static String m2(choice) => "${Intl.select(choice, {
            'lan_0': 'Simplified Chinese',
            'lan_1': 'English',
          })}";

  static String m3(choice) => "${Intl.select(choice, {
            'lan_0': 'Simplified Chinese',
            'lan_1': 'English',
          })}";

  static String m4(choice) => "${Intl.select(choice, {
            'mode_0': 'Auto mode (System)',
            'mode_1': 'Light mode',
            'mode_2': 'Dark mode',
          })}";

  static String m5(choice) => "${Intl.select(choice, {
            'mode_0': 'Auto (System)',
            'mode_1': 'Light',
            'mode_2': 'Dark',
          })}";

  static String m6(choice) => "${Intl.select(choice, {
            'theme_0': 'Bahama Blue',
            'theme_1': 'Mandy Red',
            'theme_2': 'Money',
            'theme_3': 'Mango',
            'theme_4': 'Espresso',
            'theme_5': 'San Juan Blue',
            'theme_6': 'Red Wine',
            'theme_7': 'forest',
          })}";

  static String m7(choice) => "${Intl.select(choice, {
            'theme_0': 'Bahama Blue',
            'theme_1': 'Mandy Red',
            'theme_2': 'Money',
            'theme_3': 'Mango',
            'theme_4': 'Espresso',
            'theme_5': 'San Juan Blue',
            'theme_6': 'Red Wine',
            'theme_7': 'forest',
          })}";

  static String m8(name, createTime) =>
      "Tag information: \n1. Tag name: ${name};\n2. Create date: ${createTime}.\n 3. Tips: all of ToDOs of the tag will remove from list after deleting this tag.";

  static String m9(name, createTime) =>
      "Tag information: \n1. Tag name: ${name};\n2. Create date: ${createTime}.\n 3. Tips: all of ToDOs of the tag will remove from list after deleting this tag.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_default_exception_page_action_btn_feedback":
            MessageLookupByLibrary.simpleMessage("Feedback"),
        "app_default_exception_page_action_toast_feedback":
            MessageLookupByLibrary.simpleMessage("Thanks~"),
        "app_default_exception_page_tip": MessageLookupByLibrary.simpleMessage(
            "Sorry, some problems happened with the application. \nCould you please click the Feedback button to submit information to help developers analyze the problems?"),
        "app_default_exception_page_title":
            MessageLookupByLibrary.simpleMessage("Running error"),
        "app_tab_assert": MessageLookupByLibrary.simpleMessage("Assert"),
        "app_tab_feed": MessageLookupByLibrary.simpleMessage("Feed"),
        "app_tab_log": MessageLookupByLibrary.simpleMessage("Me-log"),
        "app_tab_setting": MessageLookupByLibrary.simpleMessage("Setting"),
        "app_tab_todos": MessageLookupByLibrary.simpleMessage("ToDOs"),
        "bedrock_confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "bedrock_refreshTwoLevel":
            MessageLookupByLibrary.simpleMessage("Refresh"),
        "bedrock_reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "common_any_page_label_text_design":
            MessageLookupByLibrary.simpleMessage("Designing..."),
        "common_any_page_widget_text_custom": m0,
        "common_custom_params": m1,
        "common_designing_label":
            MessageLookupByLibrary.simpleMessage("Designing..."),
        "common_exception_page_appbar_title":
            MessageLookupByLibrary.simpleMessage("Running error"),
        "common_exception_page_btn_tooltip_text_submit":
            MessageLookupByLibrary.simpleMessage("Submit error information"),
        "common_exception_page_tip_text": MessageLookupByLibrary.simpleMessage(
            "Sorry, some problems happened with the application. \nCould you please click the Feedback button to submit information to help developers analyze the problems?"),
        "common_exception_page_toast_text_submit":
            MessageLookupByLibrary.simpleMessage("Thanks~"),
        "common_month_calendar_page_btn_text_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "common_month_calendar_page_btn_text_confirm":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "main_bottombar_widget_tab_text_assert":
            MessageLookupByLibrary.simpleMessage("Assert"),
        "main_bottombar_widget_tab_text_feed":
            MessageLookupByLibrary.simpleMessage("Feed"),
        "main_bottombar_widget_tab_text_log":
            MessageLookupByLibrary.simpleMessage("Me-log"),
        "main_bottombar_widget_tab_text_setting":
            MessageLookupByLibrary.simpleMessage("Setting"),
        "main_bottombar_widget_tab_text_todos":
            MessageLookupByLibrary.simpleMessage("ToDOs"),
        "month_calendar_page_btn_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "month_calendar_page_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "setting_font_page_text_example": MessageLookupByLibrary.simpleMessage(
            "Example: \nAlmost before we knew it, we had left the ground.\n几乎在我们意识到之前，我们已经离开了地面。\n1234567890"),
        "setting_font_page_tip_support_fonts":
            MessageLookupByLibrary.simpleMessage("Support fonts"),
        "setting_language_page_option_language_choice": m2,
        "setting_language_set_options": m3,
        "setting_language_set_text1":
            MessageLookupByLibrary.simpleMessage("Simplified Chinese"),
        "setting_language_set_text2":
            MessageLookupByLibrary.simpleMessage("English"),
        "setting_main_page_appbar_title":
            MessageLookupByLibrary.simpleMessage("Setting"),
        "setting_main_page_option_base_setting_font":
            MessageLookupByLibrary.simpleMessage("Font"),
        "setting_main_page_option_base_setting_language":
            MessageLookupByLibrary.simpleMessage("Language"),
        "setting_main_page_option_base_setting_theme":
            MessageLookupByLibrary.simpleMessage("Theme"),
        "setting_main_page_option_base_setting_theme_mode":
            MessageLookupByLibrary.simpleMessage("Theme mode"),
        "setting_main_page_tip_base_setting":
            MessageLookupByLibrary.simpleMessage("Basic setting"),
        "setting_option_language_text":
            MessageLookupByLibrary.simpleMessage("Language"),
        "setting_option_text_font_set_display_text":
            MessageLookupByLibrary.simpleMessage(
                "Example: \nAlmost before we knew it, we had left the ground.\n几乎在我们意识到之前，我们已经离开了地面。\n1234567890"),
        "setting_option_text_font_text":
            MessageLookupByLibrary.simpleMessage("Font"),
        "setting_option_text_font_tip_text1":
            MessageLookupByLibrary.simpleMessage("Support fonts"),
        "setting_option_theme_mode_text":
            MessageLookupByLibrary.simpleMessage("Theme mode"),
        "setting_option_theme_text":
            MessageLookupByLibrary.simpleMessage("Theme"),
        "setting_page_appbar_title":
            MessageLookupByLibrary.simpleMessage("Setting"),
        "setting_page_group_tip_text1":
            MessageLookupByLibrary.simpleMessage("Basic setting"),
        "setting_theme_mode_page_option_theme_mode_choice": m4,
        "setting_theme_mode_set_options": m5,
        "setting_theme_page_option_theme_choice": m6,
        "setting_theme_set_options": m7,
        "tag_detail_appbar_title_edit":
            MessageLookupByLibrary.simpleMessage("Edit tag"),
        "tag_detail_appbar_title_new":
            MessageLookupByLibrary.simpleMessage("New tag"),
        "tag_detail_btn_confirm": MessageLookupByLibrary.simpleMessage("Save"),
        "tag_detail_color_picker_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "tag_detail_save_tip_duplicate_name":
            MessageLookupByLibrary.simpleMessage(
                "duplicate tag name, please input different name"),
        "tag_detail_save_tip_empty_name": MessageLookupByLibrary.simpleMessage(
            "empty tag name, please input some text"),
        "tag_detail_tag_info_label": MessageLookupByLibrary.simpleMessage(
            "Pick up a color you like and edit tag name"),
        "tag_drawer_item_daily_todo":
            MessageLookupByLibrary.simpleMessage("Daily ToDOs"),
        "tag_drawer_item_new_tag":
            MessageLookupByLibrary.simpleMessage("New tag"),
        "tag_drawer_item_no_tag_todo":
            MessageLookupByLibrary.simpleMessage("ToDOs without tag"),
        "tag_drawer_item_recently_todo":
            MessageLookupByLibrary.simpleMessage("Recently ToDOs"),
        "tag_drawer_item_tip_basic":
            MessageLookupByLibrary.simpleMessage("Basic list"),
        "tag_drawer_item_tip_tag":
            MessageLookupByLibrary.simpleMessage("Tagged list"),
        "tag_drawer_menu_item_delete":
            MessageLookupByLibrary.simpleMessage("Delete"),
        "tag_drawer_menu_item_delete_tip_btn_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "tag_drawer_menu_item_delete_tip_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "tag_drawer_menu_item_delete_tip_content": m8,
        "tag_drawer_menu_item_delete_tip_title":
            MessageLookupByLibrary.simpleMessage("Want to delete this tag ?"),
        "tag_drawer_menu_item_edit":
            MessageLookupByLibrary.simpleMessage("Edit"),
        "tag_drawer_menu_item_sort":
            MessageLookupByLibrary.simpleMessage("Sort"),
        "tag_sort_appbar_title":
            MessageLookupByLibrary.simpleMessage("Sort tag(s)"),
        "tag_sort_item_btn_move_down_text":
            MessageLookupByLibrary.simpleMessage("Down"),
        "tag_sort_item_btn_move_up_text":
            MessageLookupByLibrary.simpleMessage("Up"),
        "tag_sort_tag_list_empty_tip":
            MessageLookupByLibrary.simpleMessage("No tag, let\'s create ..."),
        "todo_calendar_switch_toast_text1":
            MessageLookupByLibrary.simpleMessage("Date has been switched to"),
        "todo_card_detail_query_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "todo_card_detail_query_completed_date_label":
            MessageLookupByLibrary.simpleMessage("Completed date"),
        "todo_card_detail_query_content_label":
            MessageLookupByLibrary.simpleMessage("Content"),
        "todo_card_detail_query_crete_date_label":
            MessageLookupByLibrary.simpleMessage("Create date"),
        "todo_card_detail_query_desc_label":
            MessageLookupByLibrary.simpleMessage("Description"),
        "todo_card_detail_query_has_completed":
            MessageLookupByLibrary.simpleMessage("Doing"),
        "todo_card_detail_query_is_completed_label":
            MessageLookupByLibrary.simpleMessage("status"),
        "todo_card_detail_query_level_label":
            MessageLookupByLibrary.simpleMessage("Emergency degree"),
        "todo_card_detail_query_location_label":
            MessageLookupByLibrary.simpleMessage("Location information"),
        "todo_card_detail_query_not_completed":
            MessageLookupByLibrary.simpleMessage("Done"),
        "todo_card_detail_query_subtask_label":
            MessageLookupByLibrary.simpleMessage("Sub task(s)"),
        "todo_card_detail_query_title":
            MessageLookupByLibrary.simpleMessage("ToDO Detail"),
        "todo_card_detail_query_update_date_label":
            MessageLookupByLibrary.simpleMessage("Update date"),
        "todo_card_detail_query_valid_date_label":
            MessageLookupByLibrary.simpleMessage("Valid date"),
        "todo_card_more_option":
            MessageLookupByLibrary.simpleMessage("More options"),
        "todo_card_option_btn_completed":
            MessageLookupByLibrary.simpleMessage("Done"),
        "todo_card_option_btn_delete":
            MessageLookupByLibrary.simpleMessage("Delete"),
        "todo_card_option_btn_delete_tip_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "todo_card_option_btn_delete_tip_confirm":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "todo_card_option_btn_delete_tip_title":
            MessageLookupByLibrary.simpleMessage("Delete ToDO ?"),
        "todo_card_option_btn_modify":
            MessageLookupByLibrary.simpleMessage("Modify"),
        "todo_card_option_btn_unaccomplished":
            MessageLookupByLibrary.simpleMessage("Not finished"),
        "todo_card_subtask_btn_retract":
            MessageLookupByLibrary.simpleMessage("retract"),
        "todo_card_toast_completed_text1": MessageLookupByLibrary.simpleMessage(
            "Congratulations~\nToDO completed"),
        "todo_card_toast_delete_text1":
            MessageLookupByLibrary.simpleMessage("ToDO Deleted"),
        "todo_card_toast_subtask_completed_text1":
            MessageLookupByLibrary.simpleMessage("Sub task(s) all completed"),
        "todo_card_toast_subtask_completed_text4":
            MessageLookupByLibrary.simpleMessage("Sub task completed"),
        "todo_card_toast_unaccomplished_text1":
            MessageLookupByLibrary.simpleMessage("ToDO not finished"),
        "todo_draft_appbar_option_delete_all":
            MessageLookupByLibrary.simpleMessage("Delete all"),
        "todo_draft_appbar_option_delete_all_tip_btn_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "todo_draft_appbar_option_delete_all_tip_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "todo_draft_appbar_option_delete_all_tip_content":
            MessageLookupByLibrary.simpleMessage(
                "Delete all draft and can not found any ?"),
        "todo_draft_appbar_option_delete_all_tip_title":
            MessageLookupByLibrary.simpleMessage("Delete all draft ?"),
        "todo_draft_list_item_option_delete":
            MessageLookupByLibrary.simpleMessage("Delete"),
        "todo_draft_list_item_option_delete_tip_btn_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "todo_draft_list_item_option_delete_tip_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "todo_draft_list_item_option_delete_tip_content":
            MessageLookupByLibrary.simpleMessage("Delete draft ?"),
        "todo_draft_list_item_option_delete_tip_title":
            MessageLookupByLibrary.simpleMessage("Delete draft ?"),
        "todo_draft_list_item_option_modify":
            MessageLookupByLibrary.simpleMessage("Modify"),
        "todo_draft_list_item_option_move_to_today":
            MessageLookupByLibrary.simpleMessage("Move to Today"),
        "todo_draft_list_item_option_move_to_tomorrow":
            MessageLookupByLibrary.simpleMessage("Move to Tomorrow"),
        "todo_draft_list_item_option_select_date":
            MessageLookupByLibrary.simpleMessage("Select Date"),
        "todo_draft_list_not_found_tip_text":
            MessageLookupByLibrary.simpleMessage("Not found any draft ..."),
        "todo_draft_page_appbar_title":
            MessageLookupByLibrary.simpleMessage("Draft list"),
        "todo_edit_appbar_title_add":
            MessageLookupByLibrary.simpleMessage("New ToDO"),
        "todo_edit_appbar_title_edit":
            MessageLookupByLibrary.simpleMessage("Edit ToDO"),
        "todo_edit_btn_save": MessageLookupByLibrary.simpleMessage("Save"),
        "todo_edit_content_label":
            MessageLookupByLibrary.simpleMessage("ToDO Content"),
        "todo_edit_desc_label":
            MessageLookupByLibrary.simpleMessage("Description"),
        "todo_edit_level_btn_deferrable":
            MessageLookupByLibrary.simpleMessage("Deferrable"),
        "todo_edit_level_btn_important":
            MessageLookupByLibrary.simpleMessage("Important"),
        "todo_edit_level_btn_normal":
            MessageLookupByLibrary.simpleMessage("Normal"),
        "todo_edit_level_btn_unimportant":
            MessageLookupByLibrary.simpleMessage("Unimportant"),
        "todo_edit_level_btn_urgent":
            MessageLookupByLibrary.simpleMessage("Urgent"),
        "todo_edit_level_label":
            MessageLookupByLibrary.simpleMessage("Emergency degree"),
        "todo_edit_location_label":
            MessageLookupByLibrary.simpleMessage("Location information"),
        "todo_edit_reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "todo_edit_subtask_label":
            MessageLookupByLibrary.simpleMessage("Sub task(s)"),
        "todo_edit_subtask_tip_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "todo_edit_subtask_tip_content": MessageLookupByLibrary.simpleMessage(
            "1. A ToDO contains some sub tasks, such as SubTask1, SubTask2.\n2. If a ToDO contains N sub tasks, your work completion is 1/N when you completed a sub task.\n3. ToDO will move to completed list when all its sub tasks had completed.\n4. If a ToDO completed, it\'s all sub tasks will be displayed as completed."),
        "todo_edit_subtask_tip_title":
            MessageLookupByLibrary.simpleMessage("What is sub task ?"),
        "todo_edit_toast_save_failure": MessageLookupByLibrary.simpleMessage(
            "Save failure, please try again."),
        "todo_edit_toast_save_success":
            MessageLookupByLibrary.simpleMessage("Save success !"),
        "todo_edit_valid_date_btn_draft":
            MessageLookupByLibrary.simpleMessage("Draft"),
        "todo_edit_valid_date_btn_select_date":
            MessageLookupByLibrary.simpleMessage("Select date"),
        "todo_edit_valid_date_btn_today":
            MessageLookupByLibrary.simpleMessage("Today"),
        "todo_edit_valid_date_btn_tomorrow":
            MessageLookupByLibrary.simpleMessage("Tomorrow"),
        "todo_edit_valid_date_label":
            MessageLookupByLibrary.simpleMessage("Valid date"),
        "todo_edit_valid_date_tip_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "todo_edit_valid_date_tip_content": MessageLookupByLibrary.simpleMessage(
            "1. [Today]: This ToDO will be displayed today.\n2. [Tomorrow]:  This ToDO will be displayed tomorrow.\n3. [Select date]: You can select any date after today. But, if it is today or tomorrow, the option will change to [Today] or [Tomorrow] button.\n4. [Draft]: ToDO will not be shown on any ToDO list before you select a valid date."),
        "todo_edit_valid_date_tip_title":
            MessageLookupByLibrary.simpleMessage("How to select valid date ?"),
        "todo_filtered_tab_bar_loading_label":
            MessageLookupByLibrary.simpleMessage("Searching"),
        "todo_filtered_tab_bar_state_active":
            MessageLookupByLibrary.simpleMessage("Underway"),
        "todo_filtered_tab_bar_state_all":
            MessageLookupByLibrary.simpleMessage("All"),
        "todo_filtered_tab_bar_state_completed":
            MessageLookupByLibrary.simpleMessage("Completed"),
        "todo_home_fba_btn_today": MessageLookupByLibrary.simpleMessage("☀"),
        "todo_list_placeholder_completed":
            MessageLookupByLibrary.simpleMessage("All done of ToDO"),
        "todo_list_placeholder_more_todo":
            MessageLookupByLibrary.simpleMessage("Still has unfinished ToDO"),
        "todo_list_placeholder_no_data":
            MessageLookupByLibrary.simpleMessage("No more data"),
        "todo_list_placeholder_not_found":
            MessageLookupByLibrary.simpleMessage("Not found"),
        "todo_week_label_abbr_fri": MessageLookupByLibrary.simpleMessage("Fri"),
        "todo_week_label_abbr_mon": MessageLookupByLibrary.simpleMessage("Mon"),
        "todo_week_label_abbr_sat": MessageLookupByLibrary.simpleMessage("Sat"),
        "todo_week_label_abbr_sun": MessageLookupByLibrary.simpleMessage("Sun"),
        "todo_week_label_abbr_thu": MessageLookupByLibrary.simpleMessage("Thu"),
        "todo_week_label_abbr_tue": MessageLookupByLibrary.simpleMessage("Tue"),
        "todo_week_label_abbr_wed": MessageLookupByLibrary.simpleMessage("Wed"),
        "todos_calendar_switch_widget_toast_text_date_jump":
            MessageLookupByLibrary.simpleMessage("Date has been switched to"),
        "todos_draft_page_appbar_dialog_btn_delete_all_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "todos_draft_page_appbar_dialog_btn_delete_all_confirm":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "todos_draft_page_appbar_dialog_delete_all_content":
            MessageLookupByLibrary.simpleMessage(
                "Delete all draft and can not found any?"),
        "todos_draft_page_appbar_dialog_delete_all_title":
            MessageLookupByLibrary.simpleMessage("Delete all draft?"),
        "todos_draft_page_appbar_option_delete_all":
            MessageLookupByLibrary.simpleMessage("Delete all"),
        "todos_draft_page_appbar_title":
            MessageLookupByLibrary.simpleMessage("Draft list"),
        "todos_draft_page_list_dialog_btn_delete_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "todos_draft_page_list_dialog_btn_delete_confirm":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "todos_draft_page_list_dialog_delete_content":
            MessageLookupByLibrary.simpleMessage("Delete draft?"),
        "todos_draft_page_list_dialog_delete_title":
            MessageLookupByLibrary.simpleMessage("Delete draft?"),
        "todos_draft_page_list_item_option_delete":
            MessageLookupByLibrary.simpleMessage("Delete"),
        "todos_draft_page_list_item_option_move_to_today":
            MessageLookupByLibrary.simpleMessage("Move to Today"),
        "todos_draft_page_list_option_modify":
            MessageLookupByLibrary.simpleMessage("Modify"),
        "todos_draft_page_list_option_move_to_tomorrow":
            MessageLookupByLibrary.simpleMessage("Move to Tomorrow"),
        "todos_draft_page_list_option_select_date":
            MessageLookupByLibrary.simpleMessage("Select Date"),
        "todos_draft_page_list_tip_not_found":
            MessageLookupByLibrary.simpleMessage("Not found any draft ..."),
        "todos_drawer_page_dialog_delete_tag_btn_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "todos_drawer_page_dialog_delete_tag_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "todos_drawer_page_dialog_delete_tag_content": m9,
        "todos_drawer_page_dialog_delete_tag_title":
            MessageLookupByLibrary.simpleMessage("Want to delete this tag?"),
        "todos_drawer_page_menu_tag_delete":
            MessageLookupByLibrary.simpleMessage("Delete"),
        "todos_drawer_page_menu_tag_edit":
            MessageLookupByLibrary.simpleMessage("Edit"),
        "todos_drawer_page_menu_tag_sort":
            MessageLookupByLibrary.simpleMessage("Sort"),
        "todos_drawer_page_option_daily_todo":
            MessageLookupByLibrary.simpleMessage("Daily ToDOs"),
        "todos_drawer_page_option_new_tag":
            MessageLookupByLibrary.simpleMessage("New tag"),
        "todos_drawer_page_option_no_tag_todo":
            MessageLookupByLibrary.simpleMessage("ToDOs without tag"),
        "todos_drawer_page_option_recently_todo":
            MessageLookupByLibrary.simpleMessage("Recently ToDOs"),
        "todos_drawer_page_tip_basic_list":
            MessageLookupByLibrary.simpleMessage("Basic list"),
        "todos_drawer_page_tip_tagged_list":
            MessageLookupByLibrary.simpleMessage("Tagged list"),
        "todos_edit_page_appbar_action_btn_reset":
            MessageLookupByLibrary.simpleMessage("Reset"),
        "todos_edit_page_appbar_title_add":
            MessageLookupByLibrary.simpleMessage("New ToDO"),
        "todos_edit_page_appbar_title_edit":
            MessageLookupByLibrary.simpleMessage("Edit ToDO"),
        "todos_edit_page_btn_save":
            MessageLookupByLibrary.simpleMessage("Save"),
        "todos_edit_page_dialog_btn_confirm_subtask":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "todos_edit_page_dialog_btn_confirm_valid_date":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "todos_edit_page_dialog_content_subtask":
            MessageLookupByLibrary.simpleMessage(
                "1. A ToDO contains some sub tasks, such as SubTask1, SubTask2.\n2. If a ToDO contains N sub tasks, your work completion is 1/N when you completed a sub task.\n3. ToDO will move to completed list when all its sub tasks had completed.\n4. If a ToDO completed, it\'s all sub tasks will be displayed as completed."),
        "todos_edit_page_dialog_content_valid_date":
            MessageLookupByLibrary.simpleMessage(
                "1. [Today]: This ToDO will be displayed today.\n2. [Tomorrow]:  This ToDO will be displayed tomorrow.\n3. [Select date]: You can select any date after today. But, if it is today or tomorrow, the option will change to [Today] or [Tomorrow] button.\n4. [Draft]: ToDO will not be shown on any ToDO list before you select a valid date."),
        "todos_edit_page_dialog_title_subtask":
            MessageLookupByLibrary.simpleMessage("What is sub task?"),
        "todos_edit_page_dialog_title_valid_date":
            MessageLookupByLibrary.simpleMessage("How to select valid date?"),
        "todos_edit_page_label_content":
            MessageLookupByLibrary.simpleMessage("ToDO Content"),
        "todos_edit_page_label_level":
            MessageLookupByLibrary.simpleMessage("Emergency degree"),
        "todos_edit_page_label_location":
            MessageLookupByLibrary.simpleMessage("Location information"),
        "todos_edit_page_label_remark":
            MessageLookupByLibrary.simpleMessage("Description"),
        "todos_edit_page_label_subtask":
            MessageLookupByLibrary.simpleMessage("Sub task(s)"),
        "todos_edit_page_label_valid_date":
            MessageLookupByLibrary.simpleMessage("Valid date"),
        "todos_edit_page_option_level_deferrable":
            MessageLookupByLibrary.simpleMessage("Deferrable"),
        "todos_edit_page_option_level_important":
            MessageLookupByLibrary.simpleMessage("Important"),
        "todos_edit_page_option_level_normal":
            MessageLookupByLibrary.simpleMessage("Normal"),
        "todos_edit_page_option_level_unimportant":
            MessageLookupByLibrary.simpleMessage("Unimportant"),
        "todos_edit_page_option_level_urgent":
            MessageLookupByLibrary.simpleMessage("Urgent"),
        "todos_edit_page_option_valid_date_draft":
            MessageLookupByLibrary.simpleMessage("Draft"),
        "todos_edit_page_option_valid_date_select_date":
            MessageLookupByLibrary.simpleMessage("Select date"),
        "todos_edit_page_option_valid_date_today":
            MessageLookupByLibrary.simpleMessage("Today"),
        "todos_edit_page_option_valid_date_tomorrow":
            MessageLookupByLibrary.simpleMessage("Tomorrow"),
        "todos_edit_page_toast_save_failure":
            MessageLookupByLibrary.simpleMessage(
                "Save failure, please try again."),
        "todos_edit_page_toast_save_success":
            MessageLookupByLibrary.simpleMessage("Save success !"),
        "todos_home_fba_widget_btn_today":
            MessageLookupByLibrary.simpleMessage("☀"),
        "todos_main_page_todo_list_tip_completed":
            MessageLookupByLibrary.simpleMessage("All done of ToDO"),
        "todos_main_page_todo_list_tip_has_more_todos":
            MessageLookupByLibrary.simpleMessage("Still has unfinished ToDO"),
        "todos_main_page_todo_list_tip_no_data":
            MessageLookupByLibrary.simpleMessage("No more data"),
        "todos_main_page_todo_list_tip_not_found":
            MessageLookupByLibrary.simpleMessage("Not found"),
        "todos_main_page_widget_label_week_abbr_fri":
            MessageLookupByLibrary.simpleMessage("Fri"),
        "todos_main_page_widget_label_week_abbr_mon":
            MessageLookupByLibrary.simpleMessage("Mon"),
        "todos_main_page_widget_label_week_abbr_sat":
            MessageLookupByLibrary.simpleMessage("Sat"),
        "todos_main_page_widget_label_week_abbr_sun":
            MessageLookupByLibrary.simpleMessage("Sun"),
        "todos_main_page_widget_label_week_abbr_thu":
            MessageLookupByLibrary.simpleMessage("Thu"),
        "todos_main_page_widget_label_week_abbr_tue":
            MessageLookupByLibrary.simpleMessage("Tue"),
        "todos_main_page_widget_label_week_abbr_wed":
            MessageLookupByLibrary.simpleMessage("Wed"),
        "todos_tabbar_widget_label_filtered_active":
            MessageLookupByLibrary.simpleMessage("Underway"),
        "todos_tabbar_widget_label_filtered_all":
            MessageLookupByLibrary.simpleMessage("All"),
        "todos_tabbar_widget_label_filtered_completed":
            MessageLookupByLibrary.simpleMessage("Completed"),
        "todos_tabbar_widget_tip_filtered_loading":
            MessageLookupByLibrary.simpleMessage("Searching"),
        "todos_tag_detail_page_appbar_title_edit":
            MessageLookupByLibrary.simpleMessage("Edit tag"),
        "todos_tag_detail_page_appbar_title_new":
            MessageLookupByLibrary.simpleMessage("New tag"),
        "todos_tag_detail_page_btn_save":
            MessageLookupByLibrary.simpleMessage("Save"),
        "todos_tag_detail_page_dialog_color_picker_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "todos_tag_detail_page_label_input_tip":
            MessageLookupByLibrary.simpleMessage(
                "Pick up a color you like and edit tag name"),
        "todos_tag_detail_page_toast_text_duplicate_name":
            MessageLookupByLibrary.simpleMessage(
                "duplicate tag name, please input different name"),
        "todos_tag_detail_page_toast_text_empty_name":
            MessageLookupByLibrary.simpleMessage(
                "empty tag name, please input some text"),
        "todos_tag_sort_page_appbar_title":
            MessageLookupByLibrary.simpleMessage("Sort tag(s)"),
        "todos_tag_sort_page_tag_list_btn_move_down":
            MessageLookupByLibrary.simpleMessage("Down"),
        "todos_tag_sort_page_tag_list_btn_move_up":
            MessageLookupByLibrary.simpleMessage("Up"),
        "todos_tag_sort_page_tag_list_tip_empty":
            MessageLookupByLibrary.simpleMessage("No tag, let\'s create ..."),
        "todos_todo_card_detail_widget_dialog_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "todos_todo_card_detail_widget_dialog_completed_date_label":
            MessageLookupByLibrary.simpleMessage("Completed date"),
        "todos_todo_card_detail_widget_dialog_content_label":
            MessageLookupByLibrary.simpleMessage("Content"),
        "todos_todo_card_detail_widget_dialog_crete_date_label":
            MessageLookupByLibrary.simpleMessage("Create date"),
        "todos_todo_card_detail_widget_dialog_level_label":
            MessageLookupByLibrary.simpleMessage("Emergency degree"),
        "todos_todo_card_detail_widget_dialog_location_label":
            MessageLookupByLibrary.simpleMessage("Location information"),
        "todos_todo_card_detail_widget_dialog_remark_label":
            MessageLookupByLibrary.simpleMessage("Description"),
        "todos_todo_card_detail_widget_dialog_status_label":
            MessageLookupByLibrary.simpleMessage("status"),
        "todos_todo_card_detail_widget_dialog_status_text_completed":
            MessageLookupByLibrary.simpleMessage("Done"),
        "todos_todo_card_detail_widget_dialog_status_text_doing":
            MessageLookupByLibrary.simpleMessage("Doing"),
        "todos_todo_card_detail_widget_dialog_subtask_label":
            MessageLookupByLibrary.simpleMessage("Sub task(s)"),
        "todos_todo_card_detail_widget_dialog_title":
            MessageLookupByLibrary.simpleMessage("ToDO Detail"),
        "todos_todo_card_detail_widget_dialog_update_date_label":
            MessageLookupByLibrary.simpleMessage("Update date"),
        "todos_todo_card_detail_widget_dialog_valid_date_label":
            MessageLookupByLibrary.simpleMessage("Valid date"),
        "todos_todo_card_widget_btn_subtask_retract":
            MessageLookupByLibrary.simpleMessage("retract"),
        "todos_todo_card_widget_dialog_delete_btn_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "todos_todo_card_widget_dialog_delete_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "todos_todo_card_widget_dialog_title_delete":
            MessageLookupByLibrary.simpleMessage("Delete ToDO?"),
        "todos_todo_card_widget_menu_title":
            MessageLookupByLibrary.simpleMessage("More options"),
        "todos_todo_card_widget_option_completed":
            MessageLookupByLibrary.simpleMessage("Done"),
        "todos_todo_card_widget_option_delete":
            MessageLookupByLibrary.simpleMessage("Delete"),
        "todos_todo_card_widget_option_modify":
            MessageLookupByLibrary.simpleMessage("Modify"),
        "todos_todo_card_widget_option_unaccomplished":
            MessageLookupByLibrary.simpleMessage("Not finished"),
        "todos_todo_card_widget_toast_text_all_subtask_completed":
            MessageLookupByLibrary.simpleMessage("Sub task(s) all completed"),
        "todos_todo_card_widget_toast_text_completed":
            MessageLookupByLibrary.simpleMessage(
                "Congratulations~ ToDO completed"),
        "todos_todo_card_widget_toast_text_deleted":
            MessageLookupByLibrary.simpleMessage("ToDO Deleted"),
        "todos_todo_card_widget_toast_text_subtask_completed":
            MessageLookupByLibrary.simpleMessage("Sub task completed"),
        "todos_todo_card_widget_toast_text_unaccomplished":
            MessageLookupByLibrary.simpleMessage("ToDO not finished")
      };
}
