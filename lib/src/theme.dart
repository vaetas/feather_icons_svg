import 'package:flutter/material.dart';

/// Define default values for Feather Icons for all subtree.
class FeatherIconsTheme extends InheritedWidget {
  const FeatherIconsTheme({
    Key? key,
    this.color,
    this.size,
    this.strokeWidth = 2.0,
    required Widget child,
  }) : super(key: key, child: child);

  /// [color] defaults to `Theme.of(context).iconTheme.color` when not set.
  final Color? color;

  /// [size] defaults to `Theme.of(context).iconTheme.size` when not set.
  final double? size;

  /// [strokeWidth] has no equivalent in [IconThemeData], therefore needs to be
  /// not null. Defaults to 2.0
  final double strokeWidth;

  /// Get closest [FeatherIconsTheme] above in the Widget tree.
  static FeatherIconsTheme? of(BuildContext context) {
    final FeatherIconsTheme? result =
        context.dependOnInheritedWidgetOfExactType<FeatherIconsTheme>();
    return result;
  }

  @override
  bool updateShouldNotify(FeatherIconsTheme old) =>
      color != old.color || strokeWidth != old.strokeWidth;
}
