import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/units/snack_bar_util.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/tag_vo.dart';
import 'todo_tag_vm.dart';
import 'package:i_chaos/icons/ali_icons.dart';
import 'package:oktoast/oktoast.dart';

// 标签详情页，添加/编辑标签
class PageTagDetail extends PageState {
  late final TodoTagVM _tagVM;
  late TagVO? _tag;
  late TextEditingController _tagController;
  late Color _pickColor;
  late Widget? _errorMsg;

  PageTagDetail(this._tagVM, this._tag);

  @override
  void initState() {
    super.initState();
    _tagController = TextEditingController(text: !isNewTag() ? _tag!.name : '');
    _pickColor = !isNewTag() ? _tag!.colorRGBA : Colors.black;
    _errorMsg = null;
  }

  bool isNewTag() {
    return _tag == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(AliIcons.IconReturn),
          onTap: () {
            pop();
          },
        ),
        title: Row(
          children: <Widget>[
            Text(
              isNewTag() ? S.of(context).tag_detail_appbar_title_new : S.of(context).tag_detail_appbar_title_edit,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        titleSpacing: -5,
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.grey[300],
        child: _widgetTagDetail(),
      ),
    );
  }

  Widget _widgetTagDetail() {
    const EdgeInsetsDirectional wholePadding = EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0);

    final Widget tagInputRow = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _widgetColorPickerContainer(wholePadding),
        _widgetTagInputText(wholePadding),
      ],
    );

    final Widget saveBtn = Padding(
      padding: const EdgeInsets.fromLTRB(40, 24, 40, 0),
      child: GFButton(
        text: S.of(context).tag_detail_btn_confirm,
        textStyle: const TextStyle(fontFamily: 'Lexend Deca', fontSize: 15),
        onPressed: _tagController.text.trim() != '' ? savingCallback() : null,
        color: Colors.teal,
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 17,
        ),
        size: GFSize.LARGE,
        fullWidthButton: true,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _widgetTagLabelRow(wholePadding),
        tagInputRow,
        if (_errorMsg != null)
          Padding(
            padding: wholePadding,
            child: _errorMsg,
          ),
        saveBtn,
      ],
    );
  }

  Widget _widgetTagInputText(EdgeInsetsDirectional wholePadding) {
    return Expanded(
        child: Padding(
      padding: wholePadding,
      child: TextFormField(
        controller: _tagController,
        obscureText: false,
        keyboardType: TextInputType.multiline,
        maxLines: 1,
        maxLength: 10,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: wholePadding,
        ),
        style: const TextStyle(
          fontFamily: 'Lexend Deca',
          color: Colors.black,
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    ));
  }

  Widget _widgetColorPickerContainer(EdgeInsetsDirectional wholePadding) {
    return Padding(
      padding: wholePadding,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // 唤出色盘
              return _widgetColorPicker();
            },
          );
        },
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)), color: _pickColor),
        ),
      ),
    );
  }

  Widget _widgetTagLabelRow(EdgeInsetsDirectional wholePadding) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: wholePadding,
          child: Text(
            S.of(context).tag_detail_tag_info_label,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        )
      ],
    );
  }

  // 调色盘
  Widget _widgetColorPicker() {
    Color tempColor = _pickColor;

    const PaletteType _paletteType = PaletteType.hsl;
    const bool _displayThumbColor = true;
    final List<ColorLabelType> _labelTypes = [ColorLabelType.rgb];
    const bool _displayHexInputBar = false;

    final Widget colorPicker = ColorPicker(
      pickerColor: tempColor,
      onColorChanged: (color) {
        tempColor = color;
      },
      colorPickerWidth: 300,
      pickerAreaHeightPercent: 0.7,
      enableAlpha: false,
      labelTypes: _labelTypes,
      displayThumbColor: _displayThumbColor,
      paletteType: _paletteType,
      pickerAreaBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      hexInputBar: _displayHexInputBar,
    );

    final Widget confirmBtn = InkWell(
      onTap: () {
        setState(() {
          _pickColor = tempColor;
          pop();
        });
      },
      child: SizedBox(
        width: 300,
        height: 50,
        child: Center(
          child: Text(
            S.of(context).tag_detail_color_picker_btn_confirm,
            style: const TextStyle(fontFamily: 'Lexend Deca', fontSize: 15, color: Colors.grey),
          ),
        ),
      ),
    );

    return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            colorPicker,
            const Divider(
              height: 1,
            ),
            confirmBtn,
          ],
        ),
      ),
    );
  }

  // 保存操作
  VoidCallback savingCallback() {
    return () async {
      String tagName = _tagController.text;

      if (tagName.trim() == '') {
        setState(() {
          _errorMsg = Text(
            '* ${S.of(context).tag_detail_save_tip_empty_name}',
            style: const TextStyle(fontFamily: 'Lexend Deca', fontSize: 14, color: Colors.red),
          );
        });
        return;
      }

      TagVO? vo = await _tagVM.findByName(tagName);

      // 未改标签名
      if (vo != null && !isNewTag() && vo.id == _tag!.id) {
        _tag!.name = tagName;
        _tag!.colorRGBA = _pickColor;
        _tag!.updateTime = DateTime.now();
        _tagVM.updateTag(_tag!);
        pop();
        return;
      }

      if (vo != null) {
        setState(() {
          _errorMsg = Text(
            '* ${S.of(context).tag_detail_save_tip_duplicate_name}',
            style: const TextStyle(fontFamily: 'Lexend Deca', fontSize: 14, color: Colors.red),
          );
        });
        return;
      }

      if (isNewTag()) {
        _tag = TagVO.newTag(_tagController.text, _pickColor);
        _tagVM.insertTag(_tag!);
      } else {
        _tag!.name = tagName;
        _tag!.colorRGBA = _pickColor;
        _tag!.updateTime = DateTime.now();
        _tagVM.updateTag(_tag!);
      }
      pop();
    };
  }
}
