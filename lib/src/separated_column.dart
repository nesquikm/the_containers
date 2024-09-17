import 'package:flutter/widgets.dart';
import 'package:the_containers/src/separated_mixin.dart';

/// A column that separates its children with a separator widget.
class SeparatedColumn extends Column with SeparatedMixin {
  /// Creates a column that separates its children with a separator widget.
  SeparatedColumn({
    required List<Widget> children,
    Widget? separator,
    double? separatorSize,
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
  }) : super(
          children: SeparatedMixin.buildChildren(
            separator ??
                SizedBox(
                  height: separatorSize,
                ),
            children,
          ),
        );
}
