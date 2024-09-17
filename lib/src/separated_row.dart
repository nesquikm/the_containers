import 'package:flutter/widgets.dart';
import 'package:the_containers/src/separated_mixin.dart';

/// A row that separates its children with a separator widget.
class SeparatedRow extends Row with SeparatedMixin {
  /// Creates a row that separates its children with a separator widget.
  SeparatedRow({
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
                  width: separatorSize,
                ),
            children,
          ),
        );
}
