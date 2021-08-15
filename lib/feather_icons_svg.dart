library feather_icons_svg;

import 'package:feather_icons_svg/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'src/icons.dart';

export 'src/icons.dart';
export 'src/theme.dart';

/// Similarly to Material Icons, use [FeatherIcons] Widget to display the icon.
///
/// ```dart
/// FeatherIcon(FeatherIcons.arrowLeft)
/// ```
class FeatherIcon extends StatelessWidget {
  const FeatherIcon(
    this.icon, {
    this.color,
    this.size,
    this.strokeWidth,
  });

  final FeatherIcons icon;
  final Color? color;
  final double? size;

  /// Customize icon's stroke width. Defaults to 2.0
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    final featherIconTheme = FeatherIconTheme.of(context);
    final _strokeWidth = _getStrokeWidth(featherIconTheme);
    final iconTheme = IconTheme.of(context);

    final size = _getSize(iconTheme);

    return SvgPicture.string(
      _strokeWidth != 2
          ? icon.data.replaceFirst(
              'stroke-width="2"',
              'stroke-width="$_strokeWidth"',
            )
          : icon.data,
      color: _getColor(featherIconTheme, iconTheme),
      width: size,
      height: size,
      alignment: Alignment.center,
    );
  }

  double _getStrokeWidth(FeatherIconTheme? theme) {
    if (strokeWidth != null) {
      return strokeWidth!;
    }

    if (theme != null) {
      return theme.strokeWidth;
    }

    return 2.0;
  }

  Color _getColor(FeatherIconTheme? theme, IconThemeData iconTheme) {
    if (color != null) {
      return color!;
    }

    if (iconTheme.color != null) {
      return iconTheme.color!;
    }

    return Colors.black;
  }

  double _getSize(IconThemeData iconTheme) {
    if (size != null) {
      return size!;
    }

    if (iconTheme.size != null) {
      return iconTheme.size!;
    }

    return 24;
  }
}
