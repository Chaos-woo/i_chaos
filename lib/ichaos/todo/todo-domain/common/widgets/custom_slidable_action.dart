import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomizeSlidableAction extends StatelessWidget {
  final String? label;
  final Color backgroundColor;
  final IconData? icon;
  final SlidableActionCallback? onPressed;

  // ignore: use_key_in_widget_constructors
  const CustomizeSlidableAction({Key? key, this.label, required this.backgroundColor, this.icon, this.onPressed})
      : assert(icon != null || label != null),
        super(key: key);
  
  static CustomizeSlidableAction get(SlidableActionContent content, {Key? key, SlidableActionCallback? onPressed}) {
    return CustomizeSlidableAction(
      key: key,
      label: content.label,
      backgroundColor: content.backgroundColor,
      icon: content.icon,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      label: label,
      backgroundColor: backgroundColor,
      icon: icon,
      onPressed: onPressed,
    );
  }
}

class SlidableActionContent {
  final String? label;
  final Color backgroundColor;
  final IconData? icon;

  SlidableActionContent._(this.label, this.backgroundColor, this.icon);
  
  @override
  String toString() {
    return 'SlidableActionContent{label: $label, backgroundColor: $backgroundColor, icon: $icon}';
  }

  static SlidableActionContent finish = SlidableActionContent._('做完啦', Colors.green, Icons.arrow_forward);
  static SlidableActionContent recall = SlidableActionContent._('再想想...', Colors.blue, Icons.replay);
  static SlidableActionContent edit = SlidableActionContent._('编辑', Colors.grey, Icons.edit);
  static SlidableActionContent delete = SlidableActionContent._('删除', Colors.red, Icons.delete);
}
