import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:i_chaos/ichaos/public/widgets/button-group/variable_button_label.dart';

typedef DateChanged = Future<dynamic> Function(int preIndex, int index);

class RadioButtonGroup extends StatefulWidget {
  // 按钮组文字
  final List<String> buttonGroupLabels;

  // 按钮文字大小
  final double fontSize;

  // 按钮文字字体
  final String fontFamily;

  // 按钮文字宽度
  final FontWeight fontWeight;

  // 按钮图标
  final List<IconData>? buttonGroupIcons;

  // 被选中时的按钮颜色
  final Color selectedButtonColor;

  // 未被选中时的按钮颜色
  final Color unSelectedButtonColor;

  // 自定义被选中时的按钮颜色
  final List<Color>? customSelectedButtonColor;

  // 被选中时的文字颜色
  final Color selectedLabelColor;

  // 未被选中时的文字颜色
  final Color unSelectedLabelColor;

  // 按钮间距
  final double spacing;

  // 默认选中按钮下标
  final int defaultSelectedIndex;

  // 是否横向滑动
  final bool horizontal;

  // 按钮大小
  final double size;

  // 被选中按钮下标更改时的回调
  final DateChanged? onButtonChanged;

  // 按钮可变文案
  final List<VariableButtonLabel>? variableButtonLabels;

  // 按钮是否紧密布局
  final bool compactLayout;

  RadioButtonGroup(
      {Key? key,
      required this.buttonGroupLabels,
      this.fontSize = 15,
      this.fontFamily = 'Lexend Deca',
      this.fontWeight = FontWeight.w500,
      this.buttonGroupIcons,
      this.selectedButtonColor = Colors.black,
      this.unSelectedButtonColor = Colors.white,
      this.selectedLabelColor = Colors.white,
      this.unSelectedLabelColor = Colors.black,
      this.customSelectedButtonColor,
      this.spacing = 5,
      this.defaultSelectedIndex = 0,
      this.horizontal = false,
      this.size = GFSize.MEDIUM,
      this.onButtonChanged,
      this.variableButtonLabels,
      this.compactLayout = true})
      : assert(buttonGroupLabels.length > 1),
        super(key: key);

  @override
  RadioButtonGroupState createState() => RadioButtonGroupState();
}

class RadioButtonGroupState extends State<RadioButtonGroup> {
  // 当前被选择的按钮下标
  late int selectedIndex;

  // 按钮文案备份，用于需要更改按钮标签文字的场景
  late List<String> buttonGroupLabelsCopy;

  late Map<int, VariableButtonLabel> varBtnLabelMap;

  // 滑动动画controller
  late ScrollController _scrollController;

  int get currentIndex => selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.defaultSelectedIndex;
    buttonGroupLabelsCopy = widget.buttonGroupLabels.toList();

    if (widget.variableButtonLabels != null) {
      varBtnLabelMap = {};
      for (VariableButtonLabel item in widget.variableButtonLabels!) {
        varBtnLabelMap.putIfAbsent(item.varButtonIndex, () => item);
      }
    } else {
      varBtnLabelMap = {};
    }

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 重置当前选择按钮
  void reloadIndex(int index) {
    selectedBtnChanged(index, needReloadBtnChangedFunc: false);
  }

  // 当前按钮是否被选择
  bool _isCurrentSelected(int index) {
    return index == selectedIndex;
  }

  // 获取当前按钮图标
  Icon? _getCurrentBtnIcon(int index) {
    if (widget.buttonGroupIcons == null) {
      return null;
    }

    try {
      widget.buttonGroupIcons![index];
    } catch (e) {
      throw Exception('not found button group icons');
    }

    return Icon(widget.buttonGroupIcons![index], color: _isCurrentSelected(index) ? widget.selectedLabelColor : widget.unSelectedLabelColor);
  }

  // 按钮是否自定义颜色
  bool get _isCustomSelectedButtonColor => widget.customSelectedButtonColor != null;

  // 获取当前被选择按钮的颜色，支持每个按钮的自定义颜色
  Color _getCurrentBtnSelectedColor(int index) {
    if (!_isCustomSelectedButtonColor) {
      return widget.selectedButtonColor;
    }

    try {
      widget.customSelectedButtonColor![index];
    } catch (e) {
      throw Exception('not found button group custom color');
    }

    return widget.customSelectedButtonColor![index];
  }

  @override
  Widget build(BuildContext context) {
    return widget.horizontal
        ? SizedBox(
            height: widget.size + 12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // 横向滚动
              controller: _scrollController, // 滚动的controller
              itemCount: 1,
              itemBuilder: (context, index) {
                return _GFButtonWrapWidget();
              },
            ),
          )
        : Column(
            children: <Widget>[],
          );
  }

  // ignore: non_constant_identifier_names
  Widget _GFButtonWrapWidget() {
    return Row(
      children: [
        Wrap(
          spacing: widget.spacing, // 两个widget之间横向的间隔
          direction: Axis.horizontal, // 方向
          alignment: WrapAlignment.start, // 内容排序方式
          children: List<Widget>.generate(
            widget.buttonGroupLabels.length,
            (int index) {
              double baseWidgetWidth = utf8.encode(buttonGroupLabelsCopy[index]).length / 2 * 14 + widget.size;
              baseWidgetWidth += widget.buttonGroupIcons != null ? 15 : 0;

              return _isCurrentSelected(index)
                  // 被选中的组件
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, widget.compactLayout ? 0 : widget.spacing, 0),
                      child: SizedBox(
                        width: baseWidgetWidth,
                        child: GFButton(
                          onPressed: () async {
                            selectedBtnChanged(index);
                          },
                          text: buttonGroupLabelsCopy[index],
                          textStyle: TextStyle(
                            color: widget.selectedLabelColor,
                            fontFamily: widget.fontFamily,
                            fontWeight: widget.fontWeight,
                            fontSize: 14,
                          ),
                          icon: _getCurrentBtnIcon(index),
                          color: _getCurrentBtnSelectedColor(index),
                          size: widget.size,
                          fullWidthButton: true,
                        ),
                      ),
                    )
                  // 未被选中的组件
                  : Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, widget.compactLayout ? 0 : widget.spacing, 0),
                      child: SizedBox(
                        width: baseWidgetWidth,
                        child: GFButton(
                          onPressed: () async {
                            selectedBtnChanged(index);
                          },
                          text: buttonGroupLabelsCopy[index],
                          textStyle: TextStyle(
                            color: widget.unSelectedLabelColor,
                            fontFamily: widget.fontFamily,
                            fontWeight: widget.fontWeight,
                            fontSize: 14,
                          ),
                          icon: _getCurrentBtnIcon(index),
                          color: widget.unSelectedButtonColor,
                          size: widget.size,
                          fullWidthButton: true,
                        ),
                      ),
                    );
            },
          ).toList(),
        ),
      ],
    );
  }

  // 被选择按钮更新时所作的操作
  void selectedBtnChanged(int index, {bool needReloadBtnChangedFunc = true}) async {
    if (widget.onButtonChanged != null && needReloadBtnChangedFunc) {
      await widget.onButtonChanged!(selectedIndex, index);
    }

    for (int i = 0; i < widget.buttonGroupLabels.length; i++) {
      VariableButtonLabel? varBtn = varBtnLabelMap[i];
      if (varBtn != null) {
        String? label = varBtn.varBtnPredictor(index, _isCurrentSelected(i) ? VarBtnStatus.selected : VarBtnStatus.unSelected);
        buttonGroupLabelsCopy[i] = label ?? widget.buttonGroupLabels[i];
      }
    }

    setState(() {
      selectedIndex = index;
    });
  }
}
