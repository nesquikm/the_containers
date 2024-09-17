import 'package:flutter/widgets.dart';
import 'package:the_containers/src/containers.dart';

/// An animated container that separates its children with a separator widget
/// in a row.
class AnimatedContainerRow extends AnimatedContainer {
  /// Creates a container that separates its children with a separator widget
  /// in a row.
  AnimatedContainerRow({
    required List<Widget> children,
    required super.duration,
    super.key,
    super.alignment,
    super.padding,
    double? separatorSize,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    Widget? separator,
    super.color,
    super.decoration,
    super.foregroundDecoration,
    super.width,
    super.height,
    super.constraints,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.clipBehavior = Clip.none,
    super.curve,
    super.onEnd,
  }) : super(
          child: SeparatedRow(
            separatorSize: separatorSize,
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: crossAxisAlignment,
            separator: separator,
            children: children,
          ),
        );
}
