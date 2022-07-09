import 'package:flutter/material.dart';

mixin StatefulGenerator on StatefulGeneratorView {
  StateSetter? ss;

  Widget selfGenerateStateView({Key? key}) {
    return _CommonStatefulWidget(
      key: key,
      stateBuilder: () => this,
    );
  }

  Widget extGenerateStateView(StateBuilder stateBuilder, {Key? key}) {
    return _CommonStatefulWidget(
      key: key,
      stateBuilder: stateBuilder,
    );
  }
}

typedef StateBuilder = State Function();

class _CommonStatefulWidget extends StatefulWidget {
  final StateBuilder? stateBuilder;

  const _CommonStatefulWidget({Key? key, this.stateBuilder}) : super(key: key);

  @override
  State<StatefulWidget> createState() => stateBuilder!.call();
}

abstract class StatefulGeneratorView extends State {}

