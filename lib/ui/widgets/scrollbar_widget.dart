import 'package:flutter/material.dart';
import 'package:rotary_scrollbar/rotary_scrollbar.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

final class ScrollbarWidget extends StatelessWidget with ThemeMixin {
  const ScrollbarWidget({
    required this.controller,
    required this.child,
    super.key,
  });

  final ScrollController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return RotaryScrollbar(
      width: metrics.xSmall,
      padding: metrics.xSmall,
      controller: controller,
      pageTransitionDuration: metrics.duration,
      opacityAnimationDuration: metrics.duration,
      scrollAnimationDuration: metrics.duration ~/ 2,
      child: child,
    );
  }
}
