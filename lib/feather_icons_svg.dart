library feather_icons_svg;

import 'package:feather_icons_svg/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'src/icons.dart';

export 'src/icons.dart';
export 'src/theme.dart';

/// Similarly to Material Icons, use [FeatherIcons] Widget to display the icon.
///
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
    final theme = FeatherIconsTheme.of(context);
    final _strokeWidth = _getStrokeWidth(theme);

    return SvgPicture.string(
      _strokeWidth != 2
          ? icon.data.replaceFirst(
              'stroke-width="2"',
              'stroke-width="$_strokeWidth"',
            )
          : icon.data,
      color: _getColor(theme, Theme.of(context).iconTheme),
      width: size,
      height: size,
      alignment: Alignment.center,
    );
  }

  double _getStrokeWidth(FeatherIconsTheme? theme) {
    if (strokeWidth != null) {
      return strokeWidth!;
    }

    if (theme != null) {
      return theme.strokeWidth;
    }

    return 2.0;
  }

  Color _getColor(FeatherIconsTheme? theme, IconThemeData iconTheme) {
    if (color != null) {
      return color!;
    }

    if (theme != null && theme.color != null) {
      return theme.color!;
    }

    if (iconTheme.color != null) {
      return iconTheme.color!;
    }

    return Colors.black;
  }
}
