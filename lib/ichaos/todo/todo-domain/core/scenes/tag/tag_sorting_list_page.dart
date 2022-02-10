// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base_framework/utils/image_helper.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/tag_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/tag/tag_detail_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/tag/todo_tag_vm.dart';
import 'package:i_chaos/icons/ali_icons.dart';

// 标签列表页，排序和总览
class PageTagSorting extends PageState {
  late final TodoTagVM _tagVM;
  late List<TagVO> _sortedTags;
  bool _markDirty = false;

  PageTagSorting(this._tagVM);

  @override
  void initState() {
    super.initState();
    _sortedTags = _tagVM.tagList;
  }

  void _originalTag2SortedTag() {
    if (_markDirty) {
      Map<int, TagVO> tagMap = {};
      for (TagVO vo in _tagVM.tagList) {
        tagMap[vo.id!] = vo;
      }
      for (TagVO vo in _sortedTags) {
        TagVO? ori = tagMap[vo.id!];
        if (ori != null) {
          vo.name = ori.name;
        }
      }
      _markDirty = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _originalTag2SortedTag();
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
              'Sort tags',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.assignment_turned_in),
            onPressed: () {
              DateTime now = DateTime.now();
              for (int i = 0; i < _sortedTags.length; i++) {
                TagVO vo = _sortedTags[i];
                vo.order = _sortedTags.length - i;
                vo.updateTime = now;
              }
              _tagVM.updateTags(_sortedTags);
              pop();
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[300],
        width: ScreenUtil.getInstance().screenWidth,
        height: ScreenUtil.getInstance().screenHeight - 40,
        child: _tagVM.tagList.isNotEmpty ? _widgetTagOrderList() : _widgetEmptyImage(),
      ),
    );
  }

  Widget _widgetEmptyImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageHelper.placeHolderLocalSVGImg(imageName: 'image_search_empty', width: 100, height: 100),
          Text('no tag, let go to create',
              style: const TextStyle(color: Color(0xFF757575), fontFamily: 'Lexend Deca', fontWeight: FontWeight.w500, fontSize: 12))
        ],
      ),
    );
  }

  void _switchTagPos(int i, int j) {
    TagVO temp = _sortedTags[i];
    _sortedTags[i] = _sortedTags[j];
    _sortedTags[j] = temp;
  }

  Widget _widgetTagOrderList() {
    List<OptionBarItem> tagItems = [];
    const TextStyle tagTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black, fontFamily: 'Lexend Deca');
    for (int i = 0; i < _sortedTags.length; i++) {
      TagVO tag = _sortedTags[i];

      List<Widget> opBtns = [];
      VoidCallback moveUpOp = () {
        _switchTagPos(i, i - 1);
        setState(() {});
      };
      VoidCallback moveDownOp = () {
        _switchTagPos(i, i + 1);
        setState(() {});
      };
      Widget moveUp = _inkText('上移', onTap: moveUpOp);
      Widget moveUpNoDivide = _inkText('上移', needDivide: false, onTap: moveUpOp);
      Widget moveDown = _inkText('下移', needDivide: false, onTap: moveDownOp);

      if (_sortedTags.length != 1) {
        if (i == 0) {
          opBtns.add(moveDown);
        } else if (i == _sortedTags.length - 1) {
          opBtns.add(moveUpNoDivide);
        } else {
          opBtns.add(moveUp);
          opBtns.add(moveDown);
        }
      }

      tagItems.add(
        OptionBarItem(tag.name,
            textStyle: tagTextStyle,
            icon: Icons.circle,
            iconSize: 15,
            iconColor: tag.colorRGBA,
            extensionWidget: Container(
              height: 38,
              width: 38 * 2 + 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: opBtns,
              ),
            ),
            position: OptionExtensionContentPosition.right, onTap: () async {
          await push(PageTagDetail(_tagVM, tag));
          await _tagVM.refresh();
          _markDirty = true;
          setState(() {});
        }),
      );
    }

    return OptionBarList(
      optionBarItemGroups: [tagItems],
      optionItemHeight: 38,
    );
  }

  Widget _inkText(String text, {VoidCallback? onTap, Color textColor = Colors.teal, bool needDivide = true}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: onTap,
              child: Text(
                text,
                style: TextStyle(fontSize: 13, color: textColor),
              ),
            ),
          ),
          if (needDivide)
            const Text(
              '|',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}
