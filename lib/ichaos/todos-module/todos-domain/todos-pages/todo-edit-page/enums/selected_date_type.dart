import 'package:flutter/material.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/icons/ali_icons.dart';

typedef DateTitleCb = String Function();

enum DateTypeCode { today, tomorrow, any, draft }

class SelectedDateType {
  final int typeCode;
  final String codingDesc;
  final IconData icon;
  final DateTitleCb titleCb;

  SelectedDateType._(this.typeCode, this.codingDesc, this.icon, this.titleCb);

  static SelectedDateType today = SelectedDateType._(
    DateTypeCode.today.index,
    'today',
    AliIcons.IconFlag,
    () => S.current.todos_edit_page_option_valid_date_today,
  );
  static SelectedDateType tomorrow = SelectedDateType._(
    DateTypeCode.tomorrow.index,
    'tomorrow',
    AliIcons.IconDocument,
    () => S.current.todos_edit_page_option_valid_date_tomorrow,
  );
  static SelectedDateType any = SelectedDateType._(
    DateTypeCode.any.index,
    'select date',
    AliIcons.IconTime,
    () => S.current.todos_edit_page_option_valid_date_select_date,
  );
  static SelectedDateType draft = SelectedDateType._(
    DateTypeCode.draft.index,
    'draft',
    AliIcons.IconTasklist,
    () => S.current.todos_edit_page_option_valid_date_draft,
  );
}
