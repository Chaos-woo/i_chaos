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

  static String m1(name, createTime) =>
      "Tag information: \n1. Tag name: ${name};\n2. Create date: ${createTime}.\n 3. Tips: all of ToDOs of the tag will remove from list after deleting this tag.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bedrock_confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "bedrock_refreshTwoLevel":
            MessageLookupByLibrary.simpleMessage("Refresh"),
        "bedrock_reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "common_custom_params": m0,
        "common_designing_label":
            MessageLookupByLibrary.simpleMessage("Designing..."),
        "month_calendar_page_btn_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "month_calendar_page_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "setting_language_set_text1":
            MessageLookupByLibrary.simpleMessage("Simplified Chinese"),
        "setting_language_set_text2":
            MessageLookupByLibrary.simpleMessage("English"),
        "setting_option_language_text":
            MessageLookupByLibrary.simpleMessage("Language"),
        "setting_option_theme_text":
            MessageLookupByLibrary.simpleMessage("Theme"),
        "setting_page_appbar_title":
            MessageLookupByLibrary.simpleMessage("Setting"),
        "setting_page_group_tip_text1":
            MessageLookupByLibrary.simpleMessage("Basic setting"),
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
        "tag_drawer_menu_item_delete_tip_content": m1,
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
        "todo_week_label_abbr_wed": MessageLookupByLibrary.simpleMessage("Wed")
      };
}
