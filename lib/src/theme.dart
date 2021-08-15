import 'package:flutter/material.dart';

/// Define default values for Feather Icons for all subtree.
///
/// To customize icon color use [IconTheme] instead.
class FeatherIconTheme extends InheritedWidget {
  const FeatherIconTheme({
    Key? key,
    this.strokeWidth = 2.0,
    required Widget child,
  }) : super(key: key, child: child);

  /// Defaults to 2.0
  final double strokeWidth;

  /// Get closest [FeatherIconTheme] above in the Widget tree.
  static FeatherIconTheme? of(BuildContext context) {
    final FeatherIconTheme? result =
        context.dependOnInheritedWidgetOfExactType<FeatherIconTheme>();
    return result;
  }

  @override
  bool updateShouldNotify(FeatherIconTheme old) =>
      strokeWidth != old.strokeWidth;
}
