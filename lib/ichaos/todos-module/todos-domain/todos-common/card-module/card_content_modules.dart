

import 'package:flutter/cupertino.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/card-module/card_module_mixin.dart';

// 主内容
class CardContentModule with CardModule {
  final String text;
  TextStyle? style;
  int? maxLines;

  CardContentModule(this.text, {this.style, this.maxLines});

  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }
}

// 地址信息
class CardAddressModule with CardModule {
  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}

// 日期信息
class CardPromptDateModule with CardModule {
  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}

// 备注信息
class CardRemarkModule with CardModule {
  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}

// 子任务信息
class CardSubTasksModule with CardModule {
  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}

// TAG分组信息
class CardTagModule with CardModule {
  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}

// 优先级信息
class CardPriorityModule with CardModule {
  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}

// 周期循环信息
class CardPeriodModule with CardModule {
  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}