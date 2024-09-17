import 'package:flutter/widgets.dart';

/// [SeparatedMixin] is a mixin that can be used to separate children with a
/// separator widget.
mixin SeparatedMixin on MultiChildRenderObjectWidget {
  /// Builds a list of children with a separator widget between each child.
  static List<Widget> buildChildren(Widget separator, List<Widget> children) {
    final result = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      result.add(children[i]);
      if (i != children.length - 1) {
        result.add(separator);
      }
    }

    return result;
  }
}
