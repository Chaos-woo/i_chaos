// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  static String m0(custom_params) => "${custom_params}";

  static String m1(name, createTime) =>
      "标签基本信息如下: \n1. 标签名: ${name};\n2. 创建时间: ${createTime}。\n3. 小提示：在删除该标签后，该标签下的所有ToDO将会移出该标签列表。";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bedrock_confirm": MessageLookupByLibrary.simpleMessage("确认"),
        "bedrock_refreshTwoLevel": MessageLookupByLibrary.simpleMessage("刷新"),
        "bedrock_reset": MessageLookupByLibrary.simpleMessage("重置"),
        "common_custom_params": m0,
        "common_designing_label":
            MessageLookupByLibrary.simpleMessage("施工中..."),
        "setting_language_set_text1":
            MessageLookupByLibrary.simpleMessage("简体中文"),
        "setting_language_set_text2":
            MessageLookupByLibrary.simpleMessage("英语"),
        "setting_option_language_text":
            MessageLookupByLibrary.simpleMessage("语言设置"),
        "setting_option_theme_text": MessageLookupByLibrary.simpleMessage("主题"),
        "setting_page_appbar_title": MessageLookupByLibrary.simpleMessage("设置"),
        "setting_page_group_tip_text1":
            MessageLookupByLibrary.simpleMessage("基础设置"),
        "tag_detail_appbar_title_edit":
            MessageLookupByLibrary.simpleMessage("编辑标签"),
        "tag_detail_appbar_title_new":
            MessageLookupByLibrary.simpleMessage("新增标签"),
        "tag_detail_btn_confirm": MessageLookupByLibrary.simpleMessage("保存"),
        "tag_detail_color_picker_btn_confirm":
            MessageLookupByLibrary.simpleMessage("确认"),
        "tag_detail_save_tip_duplicate_name":
            MessageLookupByLibrary.simpleMessage("重复的标签名，请重新输入"),
        "tag_detail_save_tip_empty_name":
            MessageLookupByLibrary.simpleMessage("请输入非空白的标签名"),
        "tag_detail_tag_info_label":
            MessageLookupByLibrary.simpleMessage("请选择一个喜欢的颜色和输入标签名"),
        "tag_drawer_item_daily_todo":
            MessageLookupByLibrary.simpleMessage("日常 ToDO"),
        "tag_drawer_item_new_tag": MessageLookupByLibrary.simpleMessage("新建标签"),
        "tag_drawer_item_no_tag_todo":
            MessageLookupByLibrary.simpleMessage("未分类事件列表"),
        "tag_drawer_item_recently_todo":
            MessageLookupByLibrary.simpleMessage("最近 ToDO"),
        "tag_drawer_item_tip_basic":
            MessageLookupByLibrary.simpleMessage("基础列表"),
        "tag_drawer_item_tip_tag": MessageLookupByLibrary.simpleMessage("标签列表"),
        "tag_drawer_menu_item_delete":
            MessageLookupByLibrary.simpleMessage("删除"),
        "tag_drawer_menu_item_delete_tip_btn_cancel":
            MessageLookupByLibrary.simpleMessage("取消"),
        "tag_drawer_menu_item_delete_tip_btn_confirm":
            MessageLookupByLibrary.simpleMessage("确认删除"),
        "tag_drawer_menu_item_delete_tip_content": m1,
        "tag_drawer_menu_item_delete_tip_title":
            MessageLookupByLibrary.simpleMessage("确认删除标签 ?"),
        "tag_drawer_menu_item_edit": MessageLookupByLibrary.simpleMessage("编辑"),
        "tag_drawer_menu_item_sort": MessageLookupByLibrary.simpleMessage("排序"),
        "tag_sort_appbar_title": MessageLookupByLibrary.simpleMessage("标签排序"),
        "tag_sort_item_btn_move_down_text":
            MessageLookupByLibrary.simpleMessage("下移"),
        "tag_sort_item_btn_move_up_text":
            MessageLookupByLibrary.simpleMessage("上移"),
        "tag_sort_tag_list_empty_tip":
            MessageLookupByLibrary.simpleMessage("还没标签，快去创建吧~"),
        "todo_calendar_switch_toast_text1":
            MessageLookupByLibrary.simpleMessage("跳转至"),
        "todo_card_detail_query_btn_confirm":
            MessageLookupByLibrary.simpleMessage("了解"),
        "todo_card_detail_query_completed_date_label":
            MessageLookupByLibrary.simpleMessage("完成时间"),
        "todo_card_detail_query_content_label":
            MessageLookupByLibrary.simpleMessage("内容"),
        "todo_card_detail_query_crete_date_label":
            MessageLookupByLibrary.simpleMessage("创建时间"),
        "todo_card_detail_query_desc_label":
            MessageLookupByLibrary.simpleMessage("备注"),
        "todo_card_detail_query_has_completed":
            MessageLookupByLibrary.simpleMessage("已完成"),
        "todo_card_detail_query_is_completed_label":
            MessageLookupByLibrary.simpleMessage("是否完成"),
        "todo_card_detail_query_level_label":
            MessageLookupByLibrary.simpleMessage("重要等级"),
        "todo_card_detail_query_location_label":
            MessageLookupByLibrary.simpleMessage("地点"),
        "todo_card_detail_query_not_completed":
            MessageLookupByLibrary.simpleMessage("未完成"),
        "todo_card_detail_query_subtask_label":
            MessageLookupByLibrary.simpleMessage("子任务"),
        "todo_card_detail_query_title":
            MessageLookupByLibrary.simpleMessage("ToDO 详情"),
        "todo_card_detail_query_update_date_label":
            MessageLookupByLibrary.simpleMessage("更新时间"),
        "todo_card_detail_query_valid_date_label":
            MessageLookupByLibrary.simpleMessage("ToDO展示时间"),
        "todo_card_more_option": MessageLookupByLibrary.simpleMessage("更多操作"),
        "todo_card_option_btn_completed":
            MessageLookupByLibrary.simpleMessage("完成"),
        "todo_card_option_btn_delete":
            MessageLookupByLibrary.simpleMessage("删除"),
        "todo_card_option_btn_delete_tip_cancel":
            MessageLookupByLibrary.simpleMessage("再想想..."),
        "todo_card_option_btn_delete_tip_confirm":
            MessageLookupByLibrary.simpleMessage("确认"),
        "todo_card_option_btn_delete_tip_title":
            MessageLookupByLibrary.simpleMessage("确认删除?"),
        "todo_card_option_btn_modify":
            MessageLookupByLibrary.simpleMessage("修改"),
        "todo_card_option_btn_unaccomplished":
            MessageLookupByLibrary.simpleMessage("再想想完成没?"),
        "todo_card_subtask_btn_retract":
            MessageLookupByLibrary.simpleMessage("收起"),
        "todo_card_toast_completed_text1":
            MessageLookupByLibrary.simpleMessage("恭喜~(o≖◡≖)"),
        "todo_card_toast_completed_text2":
            MessageLookupByLibrary.simpleMessage("任务"),
        "todo_card_toast_completed_text3":
            MessageLookupByLibrary.simpleMessage("完成了"),
        "todo_card_toast_delete_text1":
            MessageLookupByLibrary.simpleMessage("已删除 ε==3"),
        "todo_card_toast_delete_text2":
            MessageLookupByLibrary.simpleMessage("任务"),
        "todo_card_toast_subtask_completed_text1":
            MessageLookupByLibrary.simpleMessage("恭喜~(o≖◡≖)"),
        "todo_card_toast_subtask_completed_text2":
            MessageLookupByLibrary.simpleMessage("任务"),
        "todo_card_toast_subtask_completed_text3":
            MessageLookupByLibrary.simpleMessage("完成了"),
        "todo_card_toast_subtask_completed_text4":
            MessageLookupByLibrary.simpleMessage("恭喜! 又迈向成功一小步~(o≖◡≖)"),
        "todo_card_toast_subtask_completed_text5":
            MessageLookupByLibrary.simpleMessage("子任务"),
        "todo_card_toast_subtask_completed_text6":
            MessageLookupByLibrary.simpleMessage("完成了"),
        "todo_card_toast_unaccomplished_text1":
            MessageLookupByLibrary.simpleMessage("点错了吧? 明明完成了 (O_O)?"),
        "todo_card_toast_unaccomplished_text2":
            MessageLookupByLibrary.simpleMessage("任务"),
        "todo_draft_appbar_option_delete_all":
            MessageLookupByLibrary.simpleMessage("全部删除"),
        "todo_draft_appbar_option_delete_all_tip_btn_cancel":
            MessageLookupByLibrary.simpleMessage("取消"),
        "todo_draft_appbar_option_delete_all_tip_btn_confirm":
            MessageLookupByLibrary.simpleMessage("确认"),
        "todo_draft_appbar_option_delete_all_tip_content":
            MessageLookupByLibrary.simpleMessage("是否删除全部草稿 ?"),
        "todo_draft_appbar_option_delete_all_tip_title":
            MessageLookupByLibrary.simpleMessage("删除全部草稿 ?"),
        "todo_draft_list_item_option_delete":
            MessageLookupByLibrary.simpleMessage("删除"),
        "todo_draft_list_item_option_delete_tip_btn_cancel":
            MessageLookupByLibrary.simpleMessage("取消"),
        "todo_draft_list_item_option_delete_tip_btn_confirm":
            MessageLookupByLibrary.simpleMessage("确认"),
        "todo_draft_list_item_option_delete_tip_content":
            MessageLookupByLibrary.simpleMessage("是否删除草稿 ?"),
        "todo_draft_list_item_option_delete_tip_title":
            MessageLookupByLibrary.simpleMessage("删除草稿 ?"),
        "todo_draft_list_item_option_modify":
            MessageLookupByLibrary.simpleMessage("修改"),
        "todo_draft_list_item_option_move_to_today":
            MessageLookupByLibrary.simpleMessage("移至今日"),
        "todo_draft_list_item_option_move_to_tomorrow":
            MessageLookupByLibrary.simpleMessage("移至明日"),
        "todo_draft_list_item_option_select_date":
            MessageLookupByLibrary.simpleMessage("选择日期"),
        "todo_draft_list_not_found_tip_text":
            MessageLookupByLibrary.simpleMessage("没有找到任何草稿喔~"),
        "todo_draft_page_appbar_title":
            MessageLookupByLibrary.simpleMessage("草稿箱"),
        "todo_edit_appbar_title_add":
            MessageLookupByLibrary.simpleMessage("新增"),
        "todo_edit_appbar_title_edit":
            MessageLookupByLibrary.simpleMessage("编辑"),
        "todo_edit_btn_save": MessageLookupByLibrary.simpleMessage("保存"),
        "todo_edit_content_label":
            MessageLookupByLibrary.simpleMessage("快记录下要做什么?"),
        "todo_edit_desc_label": MessageLookupByLibrary.simpleMessage("描述一下呗?"),
        "todo_edit_level_btn_deferrable":
            MessageLookupByLibrary.simpleMessage("可延期"),
        "todo_edit_level_btn_important":
            MessageLookupByLibrary.simpleMessage("重要"),
        "todo_edit_level_btn_normal":
            MessageLookupByLibrary.simpleMessage("普通"),
        "todo_edit_level_btn_unimportant":
            MessageLookupByLibrary.simpleMessage("不重要"),
        "todo_edit_level_btn_urgent":
            MessageLookupByLibrary.simpleMessage("紧急"),
        "todo_edit_level_label":
            MessageLookupByLibrary.simpleMessage("很重要的事情会排在前面喔!"),
        "todo_edit_location_label":
            MessageLookupByLibrary.simpleMessage("需要记录下地点吗?"),
        "todo_edit_reset": MessageLookupByLibrary.simpleMessage("重置"),
        "todo_edit_subtask_label":
            MessageLookupByLibrary.simpleMessage("需要把任务分阶段完成吗?"),
        "todo_edit_subtask_tip_btn_confirm":
            MessageLookupByLibrary.simpleMessage("了解啦~"),
        "todo_edit_subtask_tip_content": MessageLookupByLibrary.simpleMessage(
            "1. 事件可认为是多个子任务的合集。\n2. 当事件被分为X个子任务时，X1任务完成时，事件完成度为1/X，依此类推。\n3. 当事件下的所有子任务完成时，该事件将被标识为完成，且被移动至【已完成】列表。\n4. 若直接将事件更改为完成状态，则其下的所有子任务将被展示为完成状态，如若事件从【已完成】状态变为【未完成】状态，则子任务将会展示为原来的状态。"),
        "todo_edit_subtask_tip_title":
            MessageLookupByLibrary.simpleMessage("子任务是什么?"),
        "todo_edit_toast_save_failure":
            MessageLookupByLibrary.simpleMessage("保存失败"),
        "todo_edit_toast_save_success":
            MessageLookupByLibrary.simpleMessage("保存成功"),
        "todo_edit_valid_date_btn_draft":
            MessageLookupByLibrary.simpleMessage("草稿箱"),
        "todo_edit_valid_date_btn_select_date":
            MessageLookupByLibrary.simpleMessage("选择日期"),
        "todo_edit_valid_date_btn_today":
            MessageLookupByLibrary.simpleMessage("今日"),
        "todo_edit_valid_date_btn_tomorrow":
            MessageLookupByLibrary.simpleMessage("明日"),
        "todo_edit_valid_date_label":
            MessageLookupByLibrary.simpleMessage("是哪天需要提醒?"),
        "todo_edit_valid_date_tip_btn_confirm":
            MessageLookupByLibrary.simpleMessage("了解啦~"),
        "todo_edit_valid_date_tip_content": MessageLookupByLibrary.simpleMessage(
            "1. 【今日】: 为进入该页面的当天时间。\n2. 【明日】: 为进入该页面的当天向后增加一天。\n3. 【选择日期】: 可以选择今日后的任意一天，当选择今日或明日的时间时将会自动转变为前两个选项。\n4. 【草稿箱】: 将会把事件存储在草稿箱中，等待被编辑至对应的日期，不展示在事件列表中。"),
        "todo_edit_valid_date_tip_title":
            MessageLookupByLibrary.simpleMessage("日期怎么选择?"),
        "todo_filtered_tab_bar_loading_label":
            MessageLookupByLibrary.simpleMessage("搜索中"),
        "todo_filtered_tab_bar_state_active":
            MessageLookupByLibrary.simpleMessage("进行中"),
        "todo_filtered_tab_bar_state_all":
            MessageLookupByLibrary.simpleMessage("全部"),
        "todo_filtered_tab_bar_state_completed":
            MessageLookupByLibrary.simpleMessage("已完成"),
        "todo_home_fba_btn_today": MessageLookupByLibrary.simpleMessage("今"),
        "todo_list_placeholder_completed":
            MessageLookupByLibrary.simpleMessage("ToDO都完成啦~"),
        "todo_list_placeholder_more_todo":
            MessageLookupByLibrary.simpleMessage("还有待完成的事项喔~"),
        "todo_list_placeholder_no_data":
            MessageLookupByLibrary.simpleMessage("没有更多记录啦"),
        "todo_list_placeholder_not_found":
            MessageLookupByLibrary.simpleMessage("什么都没有找到呢~"),
        "todo_week_label_abbr_fri": MessageLookupByLibrary.simpleMessage("周五"),
        "todo_week_label_abbr_mon": MessageLookupByLibrary.simpleMessage("周一"),
        "todo_week_label_abbr_sat": MessageLookupByLibrary.simpleMessage("周六"),
        "todo_week_label_abbr_sun": MessageLookupByLibrary.simpleMessage("周日"),
        "todo_week_label_abbr_thu": MessageLookupByLibrary.simpleMessage("周四"),
        "todo_week_label_abbr_tue": MessageLookupByLibrary.simpleMessage("周二"),
        "todo_week_label_abbr_wed": MessageLookupByLibrary.simpleMessage("周三")
      };
}
