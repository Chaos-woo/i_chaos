import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/running_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/widgets/stateless_ctrl_widget.dart';

class HomeTodoSlideBtnsCtrl extends RunningStateCtrl implements GetxService {
  static const Offset begin = Offset(0, 0);
  static const Offset end = Offset(1, 0);
  Offset slideOffset = begin;

  HomeTodoSlideBtnsCtrl();

  void slideOutScreen() {
    slideOffset = end;
    updateBuilder();
  }

  void slideBackScreen() {
    slideOffset = begin;
    updateBuilder();
  }
}

class HomeTodoSlideBtnsWidget extends StatelessCtrlWidget<HomeTodoSlideBtnsCtrl> {
  List<Widget> floatingBtnEntries;

  HomeTodoSlideBtnsWidget(this.floatingBtnEntries, {Key? key}) : super(key: key);

  @override
  Widget ctrlWidgetBuilder() {
    return GetBuilder<HomeTodoSlideBtnsCtrl>(builder: (_) {
      return AnimatedSlide(
        offset: metaCtrl.slideOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutExpo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: floatingBtnEntries,
        ),
      );
    });
  }
}
