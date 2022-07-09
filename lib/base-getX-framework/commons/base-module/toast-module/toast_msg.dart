import 'package:flutter/material.dart';

class ToastMsg {
  String? msg;
  IconData? icon;

  ToastMsg.msg(this.msg);

  ToastMsg.iconMsg(this.msg, this.icon);

  String singleMsg() {
    return msg ?? '';
  }

  IconToast iconToast() {
    return IconToast.toast(icon, msg ?? '');
  }
}

class IconToast extends StatelessWidget {
  final IconData? preIcon;
  final String msg;

  const IconToast.toast(this.preIcon, this.msg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // same toast_widget.dart
    List<Widget> iconTextRow = [];
    if (preIcon != null) {
      iconTextRow.add(Icon(
        preIcon,
        size: 24,
        color: Colors.white,
      ));
      iconTextRow.add(
        const SizedBox(
          width: 5,
        ),
      );
    }

    iconTextRow.add(Text(msg, style: const TextStyle(color: Colors.white)));

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: iconTextRow,
        ),
      ),
    );
  }
}
