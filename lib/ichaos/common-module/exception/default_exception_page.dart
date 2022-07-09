// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/widget-chain/widget_chain.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateless_view.dart';
import 'package:i_chaos/generated/l10n.dart';

// 非业务型异常展示的页面
class ExceptionPageState extends BaseStatelessView {
  final String exception;
  final String stack;

  ExceptionPageState(this.exception, this.stack, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorText = Text(exception, style: const TextStyle(color: Colors.black))
        .addNeighbor(Text(stack, style: const TextStyle(color: Colors.blue)))
        .intoColumn(mainAxisAlignment: MainAxisAlignment.center);

    return Scaffold(
      appBar: backNavBar(
        title: S.of(context).app_default_exception_page_title,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: errorText,
      ),
    );
  }
}
