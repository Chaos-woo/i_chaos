import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

/// 回调函数定义
typedef MiniChipOnTapCallback = void Function();

class MiniChip extends StatelessWidget {
  String content;
  TextStyle style;
  BadgeShape? shape;
  double? borderRadius;
  Color badgeColor;
  double? elevation;
  MiniChipOnTapCallback? onTap;

  MiniChip({required this.content, required this.badgeColor, this.style = const TextStyle(fontSize: 12), this.shape = BadgeShape.square, this.borderRadius = 10, this.elevation = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
      child: InkWell(
          child: Badge(
            toAnimate: false,
            shape: BadgeShape.square,
            badgeColor: badgeColor,
            borderRadius: BorderRadius.circular(borderRadius!),
            badgeContent: Text('$content', style: style,),
            elevation: elevation!,
          ),
          onTap: onTap
      ),
    );
  }
}
