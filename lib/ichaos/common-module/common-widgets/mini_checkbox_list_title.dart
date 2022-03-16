import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

class MiniCheckboxListTitle extends StatelessWidget {
  final String? title;
  final Function(bool?) onTap;
  final double? borderSize;
  final bool? isChecked;
  final double? topPadding;
  final double? bottomPadding;
  final double? iconTitlePadding;
  final TextStyle? textStyle;
  final int? maxLines;
  final GFCheckboxType? type;
  final Widget? activeIcon;
  final Widget? inactiveIcon;
  final Color activeBgColor;

  const MiniCheckboxListTitle({
    this.title,
    required this.onTap,
    this.borderSize = 15,
    this.topPadding = 4,
    this.bottomPadding = 2,
    this.iconTitlePadding = 8,
    this.textStyle = const TextStyle(
      height: 1.1,
    ),
    this.maxLines = 1,
    this.isChecked = false,
    this.type = GFCheckboxType.circle,
    this.activeIcon = const Icon(
      Icons.check,
      size: 10,
      color: GFColors.WHITE,
    ),
    this.activeBgColor = Colors.green,
    this.inactiveIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: topPadding!)),
        Row(
          children: <Widget>[
            GFCheckbox(
              activeBgColor: activeBgColor,
              size: borderSize!,
              type: type!,
              onChanged: onTap,
              value: isChecked!,
              inactiveIcon: inactiveIcon,
              activeIcon: activeIcon!,
              inactiveBorderColor: Colors.grey,
            ),
            Padding(padding: EdgeInsets.only(right: iconTitlePadding!)),
            SizedBox(width: iconTitlePadding!,),
            Expanded(child: Text(
              title ?? '',
              style: textStyle,
              maxLines: maxLines,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: bottomPadding!)),
      ],
    );
  }
}