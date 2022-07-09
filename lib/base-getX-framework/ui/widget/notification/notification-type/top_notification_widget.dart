import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/notification/abstract_notification.dart';

class TopNotificationWidget extends StatefulWidget {
  final Widget child;
  final Duration animationDuration;
  final Duration notifyDwellTime;
  final NotifyDoneCallback notifyDone;

  const TopNotificationWidget(
    this.child,
    this.animationDuration,
    this.notifyDwellTime,
    this.notifyDone, {
    Key? key,
  }) : super(key: key);

  @override
  _TopNotificationWidgetState createState() => _TopNotificationWidgetState();
}

class _TopNotificationWidgetState extends State<TopNotificationWidget> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.animationDuration);
    animation = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(widget.notifyDwellTime).whenComplete(() => controller.reverse().whenComplete(() => widget.notifyDone(true)));
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget animationWidget = AnimatedBuilder(
      animation: animation,
      builder: (ctx, _) {
        return SlideTransition(
          position: animation as Animation<Offset>,
          child: widget.child,
        );
      },
    );

    return Column(
      children: [animationWidget],
    );
  }
}
